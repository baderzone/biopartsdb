class SequencingPlate < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  
  has_many :sequencing_plate_wells
  
  scope :available, joins(:sequencing_plate_wells).where(:sequencing_plate_wells => {:sequencing_growth_plate_well_id => nil}).uniq

  attr_accessible :name
  attr_accessible :status_id
  
  def index_by_well
    plate = Hash.new
    
    sequencing_plate_wells.each do |w|
      if !w.sequencing_growth_plate_well_id.nil?
        plate[w.well] = w
      end
    end
    
    return plate
  end
  
  def index_by_part
    index = Hash.new
    
    sequencing_plate_wells.each do |w|
      if !w.sequencing_growth_plate_well.nil?
        part = w.sequencing_growth_plate_well.sequencing_product.clone.transformation.ligation_product.to_s
        plate = w.sequencing_growth_plate_well.sequencing_growth_plate
        
        if !index.key?(part)
          index[part] = Hash.new
        end
        
        if !index[part].key?(plate)
          index[part][plate] = []
        end
        
        index[part][plate] << w.well
      end
    end
    
    return index
  end
  
end
