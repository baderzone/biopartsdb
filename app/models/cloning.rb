class Cloning < ActiveRecord::Base
  belongs_to :user
  belongs_to :growth_plate
  belongs_to :protocol
  
  has_many :clones, :dependent => :destroy
  
  accepts_nested_attributes_for :clones

  attr_accessible :user, :growth_plate, :protocol
  attr_accessible :clones_ids, :clones_attributes
  
  validates :transformation, :presence => :true

end
