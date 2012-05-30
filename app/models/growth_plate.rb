class GrowthPlate < ActiveRecord::Base
  belongs_to :user
  
  has_many :growth_plate_wells, :dependent => :destroy
  attr_accessible :name, :user

  def to_s
    "#{name}"
  end
  
  def wells_index
    plate = Hash.new
    growth_plate_wells.each do |gpw|
      plate[gpw.well] = gpw
    end
    return plate
  end
  
  def index_by_part
    index = Hash.new
    
    growth_plate_wells.each do |w|
      part = w.clone.transformation.ligation_product.to_s
        
      if !index.key?(part)
        index[part] = []
      end
        
      index[part] << w.well
    end
    
    return index
  end
  
end
