class Tpcr < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :protocol
  belongs_to :device
  
  has_many :tpcr_products, :dependent => :destroy
  has_many :parts, :through => :tpcr_products
  
  accepts_nested_attributes_for :tpcr_products
  
  validates :device, :parts, :status, :presence => true

end
