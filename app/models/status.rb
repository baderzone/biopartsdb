class Status < ActiveRecord::Base
  attr_accessible :class, :description, :process, :name, :default
end
