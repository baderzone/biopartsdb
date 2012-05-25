class GrowthPlate < ActiveRecord::Base
  belongs_to :user
  
  has_many :growth_plate_wells, :dependent => :destroy
  attr_accessible :name, :user
  
  def wells_index
    plate = Hash.new
    growth_plate_wells.each do |gpw|
      plate[gpw.well] = gpw
    end
    return plate
  end
  
end
