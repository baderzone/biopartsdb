class Oligo < ActiveRecord::Base
  belongs_to :part
  
  has_many :oligo_plate_wells
  
  attr_accessible :part
  attr_accessible :name, :sequence, :start, :stop
  
end
