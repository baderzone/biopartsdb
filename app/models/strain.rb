class Strain < ActiveRecord::Base
  belongs_to :organism
  belongs_to :vendor

  attr_accessible :name
  attr_accessible :organism_id, :vendor_id
  
  validates :name, :organism, :vendor, :presence => true
  
  def to_s
    name
  end
  
end
