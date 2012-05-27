class Cspcr < ActiveRecord::Base
  belongs_to :user
  belongs_to :protocol
  belongs_to :status
  belongs_to :device
  has_one :cspcr_plate 
  
  has_many :cspcr_products, :dependent => :destroy
  has_many :clones, :through => :cspcr_products
  
  accepts_nested_attributes_for :cspcr_products
  
  #validates :cspcr_products, :length => {:minimum => 1, :maximum => 3 }
  validates :device, :presence => true
  
  attr_accessible :user, :protocol, :status, :device, :cspcr_plate
  attr_accessible :clone_ids, :device_id, :status_id
  attr_accessible :cspcr_products_attributes
end
