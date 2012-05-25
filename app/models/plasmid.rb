class Plasmid < ActiveRecord::Base
  belongs_to :vendor
  
  attr_accessible :name, :vendor
  
  def to_s
    "#{name}"
  end
end
