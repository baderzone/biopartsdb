class CloningsController < ApplicationController
  def index
    @clonings = current_user.clonings.order("id DESC")
  end

  def show
    @cloning = Cloning.find(params[:id])
  end

  def new
    @transformations = current_user.transformations
  end

  def create
    transformation_ids = params[:transformation_ids]
    transformations = params[:transformations]
    
    num_colonies = count_colonies(transformation_ids, transformations)
    
    #checking if just one clone has been picked
    redirect_to new_cloning_path, :notice => "You cannot pick more than 95 colonies" if num_colonies > 95
    
    wells = create_wells()
    
    begin
      ActiveRecord::Base.transaction do
        plate = GrowthPlate.new(user: current_user)
        plate.save
        plate.name = "growth_plate_"+plate.id.to_s
        plate.save
        
        @cloning = Cloning.new(user: current_user, growth_plate: plate)
        @cloning.save
        
        transformation_ids.each do |t_id|
          transformation = Transformation.find(t_id)
          
          colonies = [] 
          transformations[t_id][:white].to_i.times      {|i| colonies << "white"} 
          transformations[t_id][:blue].to_i.times       {|i| colonies << "blue"}
          transformations[t_id][:light_blue].to_i.times {|i| colonies << "light_blue"}
        
          colonies.each do |colony|
            name = transformation.ligation_product.pcr_product.part.name + ".c"+ (Clone.count(:conditions => {:transformation_id => t_id})+1).to_s
            clone = Clone.new(name: name, user: current_user, cloning: @cloning, transformation_id: t_id, color: colony)
            clone.save
               
            well = GrowthPlateWell.new(clone: clone, growth_plate: plate, well: wells.pop())
            well.save          
          end      
        end
      end
      
      redirect_to cloning_path(@cloning)
    rescue => ex
      flash[:error] = "Error while performing cloning (#{ex.message})"
      redirect_to :controller => :clonings, :action => :new
    end  
  end

  def edit
    @cloning = Cloning.find(params[:id])
    @statuses = Status.find_all_by_process(Clone.to_s)
  end
  
  def update
    @cloning = Cloning.find(params[:id])
    
    if @cloning.update_attributes(params[:cloning])
      redirect_to cloning_path(@cloning), :notice => "Clones status updated"
    else
      flash[:error] = "Cannot update clones status."
      redirect_to edit_cloning_path(@cloning)
    end
    
  end
  
  private
    def count_colonies(transformation_ids, transformations)
      num_clones = 0
      transformation_ids.each do |tid|
        num_clones += transformations[tid][:white].to_i+transformations[tid][:blue].to_i+transformations[tid][:light_blue].to_i
      end
      
      return num_clones
    end
    
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
