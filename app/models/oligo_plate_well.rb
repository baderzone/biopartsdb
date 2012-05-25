class OligoPlateWell < ActiveRecord::Base
  belongs_to :oligo_plate
  belongs_to :oligo
  
  attr_accessible :oligo, :oligo_plate, :well
  
  def to_s
    oligo.name[-2..-1]
  end
  
end
