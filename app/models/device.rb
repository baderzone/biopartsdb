class Device < ActiveRecord::Base
  belongs_to :device_type
  attr_accessible :name
end
