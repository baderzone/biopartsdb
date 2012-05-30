class CspcrPlateWell < ActiveRecord::Base
  belongs_to :cspcr_plate
  belongs_to :clone
  attr_accessible :well, :cspcr_plate, :clone
  
  def to_s
    clone.name[-2..-1]
  end
  
  def plate_name
    cspcr_plate.name
  end
end
