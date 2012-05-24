class PcrGel < ActiveRecord::Base
  belongs_to :user
  belongs_to :protocol
  belongs_to :status
  
  has_many :pcr_gel_lanes, :dependent => :destroy
  has_many :pcr_gel_images
  
  
  has_many :apcr_products, :through => :pcr_gel_lanes, :source => :pcr_product, :source_type => "ApcrProduct"
  has_many :tpcr_products, :through => :pcr_gel_lanes, :source => :pcr_product, :source_type => "TpcrProduct"
  has_many :fpcr_products, :through => :pcr_gel_lanes, :source => :pcr_product, :source_type => "FpcrProduct"
  
  accepts_nested_attributes_for :apcr_products, :tpcr_products, :fpcr_products, :pcr_gel_images
  
  attr_accessible :user, :protocol, :status, :pcr_gel_images
  attr_accessible :user_id, :protocol_id, :status_id
  
  attr_accessible :apcr_products, :tpcr_products, :fpcr_products
  attr_accessible :apcr_product_ids, :tpcr_product_ids, :fpcr_product_ids
  attr_accessible :apcr_products_attributes, :tpcr_products_attributes, :fpcr_products_attributes, :pcr_gel_images_attributes
end
