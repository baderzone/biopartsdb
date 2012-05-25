class Protocol < ActiveRecord::Base
  belongs_to :user
  
  has_many :protocol_reagents

  attr_accessible :process, :content, :name, :scaling_factor, :user
end
