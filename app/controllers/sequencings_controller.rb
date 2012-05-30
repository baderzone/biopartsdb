class SequencingsController < ApplicationController
  def index
    @sequencings = current_user.sequencings.order("id DESC")
  end

  def show
    @sequencing = Sequencing.find(params[:id])
  end

  def new
    @sequencing = Sequencing.new
  end

  def create
    begin
      
      ActiveRecord::Base.transaction do
        @seq = Sequencing.new(params[:sequencing])
        @seq.user = current_user
        @seq.status = Status.find_by_process_and_default(:sequencing,true)
        @seq.save

        #retrieving the list of empty plates        
        seqplates = SequencingPlate.available.reverse
        seqplate = nil
        seqgrowthplate = nil
        wells = [] 
         
        @seq.sequencing_products.each do |rxn|
          
          if wells.empty?
            seqplate = seqplates.pop()
            
            #creating a new growth plate
            seqgrowthplate = SequencingGrowthPlate.new
            seqgrowthplate.user = current_user
            seqgrowthplate.sequencing = @seq
            seqgrowthplate.save
            seqgrowthplate.name = "seq_growth_#{seqplate.id}_#{seqgrowthplate.id}"
            seqgrowthplate.save
            
            #getting the list of databases and locking the objects so that nobody can put
            #anything on the plate until the operation is completed. 
            #Pessimistic locking is enforced to avoid all the mess 
            wells = seqplate.sequencing_plate_wells.available.lock(:true).reverse
            
          end
          
          sp_well = wells.pop()
          sgp_well = SequencingGrowthPlateWell.create(sequencing_product: rxn, sequencing_growth_plate: seqgrowthplate, well: sp_well.well)
          sp_well.sequencing_growth_plate_well = sgp_well
          sp_well.save
        end
        
      end
      redirect_to sequencing_path(@seq), :notice => "Clones submitted for sequencing."
    rescue => ex
      puts ex.message
    end
  end

  def edit
  end
  
end
