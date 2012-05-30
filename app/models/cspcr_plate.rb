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
  
  def index_by_part
    index = Hash.new
    
    cspcr_plate_wells.each do |w|
      part = w.clone.transformation.ligation_product.to_s
        
      if !index.key?(part)
        index[part] = []
      end
        
      index[part] << w.well
    end
    
    return index
  end
  
end
