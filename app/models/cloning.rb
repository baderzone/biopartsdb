class Cloning < ActiveRecord::Base
  belongs_to :user
  belongs_to :growth_plate
  
  has_many :clones, :dependent => :destroy
  
  accepts_nested_attributes_for :clones

  attr_accessible :user, :growth_plate  
  attr_accessible :clones_ids, :clones_attributes

end
