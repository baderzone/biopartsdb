class Device < ActiveRecord::Base
  belongs_to :device_type
  
  attr_accessible :name, :device_type_id
  
  validates :device_type, :name, :presence => true
  
  def to_s
    name
  end
end
