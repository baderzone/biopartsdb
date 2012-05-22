class OligoPlateWell < ActiveRecord::Base
  belongs_to :oligo_plate
  belongs_to :oligo
  
  attr_accessible :oligo_plate
  attr_accessible :oligo
  
  attr_accessible :well
  
end
