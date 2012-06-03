class DeviceType < ActiveRecord::Base
  has_many :devices
  
  attr_accessible :value, :description
  
  def to_s
    description
  end
  
end
