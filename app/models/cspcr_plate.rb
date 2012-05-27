class CspcrPlate < ActiveRecord::Base
  belongs_to :user
  belongs_to :cspcr
  
  has_many :cspcr_plate_wells, :dependent => :destroy
  
  attr_accessible :name, :user, :cspcr
  
  def to_s
    name
  end
  
  def wells_index
    plate = Hash.new
    cspcr_plate_wells.each do |csw|
      plate[csw.well] = csw
    end
    return plate
  end
end
