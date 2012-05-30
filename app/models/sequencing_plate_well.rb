class SequencingPlateWell < ActiveRecord::Base
  belongs_to :user
  belongs_to :sequencing_plate
  belongs_to :sequencing_growth_plate_well
  
  scope :available, where(:sequencing_growth_plate_well_id => nil)
  
  attr_accessible :sequencing_plate, :well
  
  def to_s
    sequencing_growth_plate_well.to_s
  end
  
  def plate_name
    sequencing_plate.name
  end
  
end
