class OligoPlate < ActiveRecord::Base
  belongs_to :vendor
  belongs_to :user
  
  has_many :oligo_plate_wells
  has_many :oligo, :through => :oligo_plate_wells
  
  attr_accessible :name, :user, :vendor
end
