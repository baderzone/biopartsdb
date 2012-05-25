class GrowthPlateWell < ActiveRecord::Base
  belongs_to :clone
  belongs_to :growth_plate, :dependent => :destroy
  attr_accessible :well, :clone, :clone_id, :growth_plate, :growth_plate_id

  def to_s
    clone.name[-2..-1]
  end

end
