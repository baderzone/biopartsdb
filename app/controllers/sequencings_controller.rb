class SequencingsController < ApplicationController
  def index
    @sequencings = current_user.sequencings.order("id DESC")
  end

  def show
  end

  def new
    @sequencing = Sequencing.new
  end

  def create
    begin
      
      ActiveRecord::Base.transaction do
        @seq = Sequencing.new(params[:sequencing])
        @seq.user = current_user
        @seq.save
        
        #creating a new sequencing growth plate 
        plate = SequencingGrowthPlate.new
        plate.user = current_user
        plate.sequencing = @seq
        plate.save
        plate.name = "seq_growth_#{plate.id}"
        plate.save
                
        wells = create_wells()
        @seq.sequencing_products.each do |rxn|
          well = SequencingGrowthPlateWell.create(sequencing_product: rxn, sequencing_growth_plate: plate, well: wells.pop())
        end
        
      end
      
      redirect_to sequencing_path(@seq), :notice => "Clones submitted for sequencing."
      
    rescue => ex
      puts ex.message
    end
  end

  def edit
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
