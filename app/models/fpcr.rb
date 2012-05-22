class Fpcr < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :device
  belongs_to :protocol
  
  has_many :fpcr_products, :dependent => :destroy
  has_many :tpcr_products, :through => :fpcr_products
  
  accepts_nested_attributes_for :fpcr_products
  
  validates :device, :fpcr_product, :status, :presence => true
end
