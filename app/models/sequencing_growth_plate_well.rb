class SequencingGrowthPlateWell < ActiveRecord::Base
  belongs_to :sequencing_growth_plate
  belongs_to :sequencing_product
  attr_accessible :well, :sequencing_growth_plate, :sequencing_product
  
  def plate_name
    sequencing_growth_plate.name
  end
  
  def to_s
    if !sequencing_product.nil?
      sequencing_product.clone.name[-2..-1]
    end
  end
  
end
