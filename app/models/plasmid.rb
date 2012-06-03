class Plasmid < ActiveRecord::Base
  belongs_to :vendor
  
  attr_accessible :name, :vendor
  attr_accessible :vendor_id
  
  validates :name, :vendor, :presence => true
  
  def to_s
    "#{name}"
  end
end
