class SequencingGrowthPlateWell < ActiveRecord::Base
  belongs_to :sequencing_growth_plate
  belongs_to :sequencing_product
  attr_accessible :well, :sequencing_growth_plate, :sequencing_product
end
