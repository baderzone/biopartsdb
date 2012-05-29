class CspcrsController < ApplicationController
  def index
    @cspcrs = current_user.cspcrs.order("id DESC")
  end

  def show
    @cspcr = Cspcr.find(params[:id])
  end

  def new
    @cspcr = Cspcr.new
    @devices = DeviceType.find_by_value(:pcr).devices
  end
  
  def create
    begin
      ActiveRecord::Base.transaction do
        @cspcr = Cspcr.new(params[:cspcr])
        @cspcr.user = current_user
        @cspcr.status = Status.find_by_process_and_default(:cspcr,true)
        @cspcr.protocol = Protocol.find_by_process(Cspcr.to_s)
        @cspcr.save
        
        cspcr_plate = CspcrPlate.create(user: current_user, cspcr: @cspcr)
        cspcr_plate.name = "cscpr_plate_#{cspcr_plate.id}"
        cspcr_plate.save
        
        wells = create_wells()
        @cspcr.cspcr_products.each do |pcr|
          CspcrPlateWell.create(cspcr_plate: cspcr_plate, clone: pcr.clone, well: wells.pop())
        end
        
      end
      
      redirect_to cspcr_path(@cspcr), :notice => "csPCR created correctly."
      
    rescue => ex
      flash[:error] = "An error occured while creating a csPCR. #{ex.message}"
      render :new
    end
  end

  def edit
    @cspcr = Cspcr.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(:cspcr)
    @devices = DeviceType.find_by_value(:pcr).devices
    @statuses = Status.find_all_by_process(:cspcr)
  end
  
  def update
    @cspcr = Cspcr.find(params[:id])
    
    if @cspcr.update_attributes(params[:cspcr])
      redirect_to cspcr_path(@cspcr), :notice => "csPCR updated correctly."
    else
      flash[:error] = "Cannot update csPCR"
      redirect_to edit_cspcr_path(@cspcr)
    end
  end
  
  private 
    
    def create_wells
      wells = []
      ('A'..'H').each do |row|
        ('01'..'12').each do |col|
          wells.push(row+col)
        end
      end  
      return wells.reverse!
    end
  
end
