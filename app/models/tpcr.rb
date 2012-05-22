class Tpcr < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :protocol
  belongs_to :device
  
  has_many :tpcr_products, :dependent => :destroy
  has_many :parts, :through => :tpcr_products
  
  accepts_nested_attributes_for :tpcr_products

  attr_accessible :parts, :device, :status, :protocol
  attr_accessible :part_ids, :device_id, :status_id, :protocol_id, :tpcr_products_attributes
  
  validates :device, :parts, :status, :presence => true

end
