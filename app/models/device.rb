class Device < ActiveRecord::Base
  belongs_to :device_type
  attr_accessible :name, :device_type_id
end
