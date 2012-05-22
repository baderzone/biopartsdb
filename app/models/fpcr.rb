class Fpcr < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :device
  belongs_to :protocol
  
  has_many :fpcr_products, :dependent => :destroy
  has_many :tpcr_products, :through => :fpcr_products
  
  accepts_nested_attributes_for :fpcr_products
  
  attr_accessible :user, :status, :device, :protocol, :tpcr_products
  attr_accessible :user_id, :status_id, :device_id, :protocol_id, :tpcr_product_ids
  attr_accessible :fpcr_products_attributes
  
  validates :device, :status, :presence => true
end
