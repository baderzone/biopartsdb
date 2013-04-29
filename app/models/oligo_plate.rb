class OligoPlate < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  
  has_many :oligo_plate_wells, :dependent => :destroy
  has_many :oligos, :through => :oligo_plate_wells
  has_many :parts, :through => :oligos
  
  attr_accessible :name, :user, :vendor
  
  ### utiling methods
  def index_by_well
    plate = Hash.new
    oligo_plate_wells.each do |w|
      plate[w.well] = w
    end
    return plate
  end
  
  def index_wells_for_part(part)
    part_wells = OligoPlateWell.joins(:oligo => :part).where(:oligos => {:part_id => part.id }, :oligo_plate_id => id)
    
    plate = Hash.new
    part_wells.each do |opw|
      plate[opw.well] = opw
    end
    return plate

  end
  
  def index_by_oligo
    index = Hash.new
    
    oligo_plate_wells.each do |w|
      if !w.oligo_id.nil?
        oligo = w.oligo.name
        
        if !index.key?(oligo)
          index[oligo] = []
        end
        
        index[oligo] << w.well
      end
    end
    
    return index
  end
end
