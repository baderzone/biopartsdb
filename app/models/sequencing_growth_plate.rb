class SequencingGrowthPlate < ActiveRecord::Base
  belongs_to :user
  belongs_to :sequencing
  
  has_many :sequencing_growth_plate_wells
  
  attr_accessible :name, :user
  
  def wells_index
    plate = Hash.new
    sequencing_growth_plate_wells.each do |sgpw|
      plate[sgpw.well] = sgpw
    end
    return plate
  end
  
  def index_by_part
    index = Hash.new
    
    sequencing_growth_plate_wells.each do |w|
      part = w.sequencing_product.clone.transformation.ligation_product.to_s
        
      if !index.key?(part)
        index[part] = []
      end
        
      index[part] << w.well
    end
    
    return index
  end
  
end
