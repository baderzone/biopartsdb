class Strain < ActiveRecord::Base
  belongs_to :organism
  belongs_to :vendor

  attr_accessible :name
  attr_accessible :organism_id, :vendor_id
  
  def to_s
    name
  end
  
end
