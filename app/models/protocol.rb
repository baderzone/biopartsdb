class Protocol < ActiveRecord::Base
  belongs_to :user
  
  has_many :protocol_reagents

  attr_accessible :process, :content, :name, :scaling_factor, :user
  
  validates :name, :content, :scaling_factor, :presence => true
  validates :scaling_factor, :numericality => { :only_integer => true, :message => "Must be an integer" }
end
