class Plasmid < ActiveRecord::Base
  belongs_to :vendor
  
  attr_accessible :name, :vendor
  attr_accessible :vendor_id
  
  def to_s
    "#{name}"
  end
end
