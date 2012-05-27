class CspcrsController < ApplicationController
  def index
    @cspcrs = current_user.cspcrs
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
        @cspcr.save
        
        cspcr_plate = CspcrPlate.new(user: current_user, cspcr: @cspcr)
        cspcr_plate.save
        cspcr_plate.name = "cscpr_plate_#{cspcr_plate.id}"
        cspcr_plate.save
        
        wells = create_wells()
        @cspcr.cspcr_products.each do |pcr|
          well = CspcrPlateWell.new(cspcr_plate: cspcr_plate, clone: pcr.clone, well: wells.pop())
          well.save
        end
        
      end
      
      redirect_to cspcr_path(@cspcr), :notice => "csPCR created correctly."
      
    rescue => ex
      flash[:error] = "An error occured while creating a csPCR. #{ex.message}"
      redirect_to new_cspcr_path 
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
