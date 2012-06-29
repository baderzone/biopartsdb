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
        @seq.protocol = Protocol.find_by_process(:sequencing)
        @seq.status = Status.find_by_process_and_default(:sequencing,true)
        @seq.save

        @seq.sequencing_products.each do |rxn|
          rxn.part = rxn.clone.transformation.ligation_product.part
          rxn.save
        end
        
        #create an hash of |part| => sequencing_reaction to be split on different plates
        parts = @seq.index_by_part()
        
        #retrieving the list of empty plates        
        seq_plates = SequencingPlate.master.available.reverse
        curr_seq_plates = Hash.new
        curr_seq_wells  = Hash.new
        
        #plating parts
        parts.keys.each do |kp|
          
          if !available_wells?(curr_seq_wells)
            curr_seq_plates = Hash.new
            curr_seq_wells = Hash.new
            seq_plate = seq_plates.pop()
            
            #creating a new growth plate
            seqgrowthplate = SequencingGrowthPlate.create_for_sequencing_plate(current_user, @seq, seq_plate)
            curr_seq_plates[seq_plate] = seqgrowthplate
            
            #creating new growth plates for replica plates
            seq_plate.replica_plates.each do |p|
              seqgrowthplate = SequencingGrowthPlate.create_for_sequencing_plate(current_user, @seq, p)
              curr_seq_plates[p] = seqgrowthplate              
            end
                        
            #getting the list of databases and locking the objects so that nobody can put
            #anything on the plate until the operation is completed. 
            #Pessimistic locking is enforced to avoid all the mess 
            curr_seq_plates.keys.each do |p|
              curr_seq_wells[p] = p.sequencing_plate_wells.available.lock(:true).reverse
            end
            
          end
          
          #one clone per well
          curr_seq_plates.keys.each do |sp|
            sp_well = curr_seq_wells[sp].pop()
            sgp_well = SequencingGrowthPlateWell.create(sequencing_product: parts[kp].pop(), sequencing_growth_plate: curr_seq_plates[sp], well: sp_well.well)
            sp_well.sequencing_growth_plate_well = sgp_well
            sp_well.save
          end
          
        end        
      end
      
      # everything fine
      redirect_to sequencing_path(@seq), :notice => "Clones submitted for sequencing."
    rescue => ex
      redirect_to new_sequencing_path, :flash => {:error => "Problem while sending clones for sequencing. #{ex.message}"}
    end
  end

  def edit
  end
  
  private

    def available_wells?(wells)      
      wells.keys.each do |k|
        return false if wells[k].empty?
      end
      return true
    end
  
end
