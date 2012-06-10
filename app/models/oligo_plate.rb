class OligoPlate < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  
  has_many :oligo_plate_wells, :dependent => :destroy
  has_many :oligos, :through => :oligo_plate_wells
  has_many :parts, :through => :oligos
  
  attr_accessible :name, :user, :vendor
  
  
  ### utiling methods
  def index_wells_for_part(part)
    part_wells = OligoPlateWell.joins(:oligo => :part).where(:oligos => {:part_id => part.id }, :oligo_plate_id => id)
    
    plate = Hash.new
    part_wells.each do |opw|
      plate[opw.well] = opw
    end
    return plate

  end
  
  
end
