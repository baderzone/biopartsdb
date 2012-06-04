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
    if num_colonies > 95
      redirect_to new_cloning_path, :notice => "You cannot pick more than 95 clones" 
    end
    

    begin
      #creating list of wells
      wells = create_wells()
      
      ActiveRecord::Base.transaction do
        #creating the growth plate
        plate = GrowthPlate.create(user: current_user)
        plate.name = "growth_plate_"+plate.id.to_s
        plate.save
        
        #creating cloning object
        @cloning = Cloning.create(user: current_user, growth_plate: plate, :protocol => Protocol.find_by_process(Cloning.to_s))
        
        #creating clones depending on the number of colonies picked
        transformation_ids.each do |tid|
          transformation = Transformation.find(tid)
          
          #creating a vector with right number of clones of each color to grow
          colonies = []
          transformations[tid].keys.each do |key|
            transformations[tid][key].to_i.times.each  { colonies << key}
          end
        
          #creating clones
          colonies.each do |colony|
            name = transformation.ligation_product.pcr_product.part.name + ".c"+ (Clone.count(:conditions => {:transformation_id => tid})+1).to_s
            clone = Clone.create(name: name, user: current_user, cloning: @cloning, transformation_id: tid, color: colony)
            #associating clones to growth plate wells
            GrowthPlateWell.create(clone: clone, growth_plate: plate, well: wells.pop())
          end      
        end
      end
      
      redirect_to cloning_path(@cloning)
      
    rescue => ex
      redirect_to :controller => :clonings, :action => :new, :flash => {:error => "Error while performing cloning (#{ex.message})" }
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
