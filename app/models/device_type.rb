class DeviceType < ActiveRecord::Base
  has_many :devices
  
  attr_accessible :value
end
