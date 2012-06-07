require 'pcr_gel_validator'

class PcrGel < ActiveRecord::Base
  validates_with PcrGelValidator
    
  belongs_to :user
  belongs_to :protocol
  belongs_to :status
  
  has_many :pcr_gel_lanes, :dependent => :destroy
  has_many :pcr_gel_images
  
  has_many :spcr_products, :through => :pcr_gel_lanes, :source => :pcr_product, :source_type => "SpcrProduct"
  has_many :tpcr_products, :through => :pcr_gel_lanes, :source => :pcr_product, :source_type => "TpcrProduct"
  has_many :fpcr_products, :through => :pcr_gel_lanes, :source => :pcr_product, :source_type => "FpcrProduct"
  accepts_nested_attributes_for :spcr_products, :tpcr_products, :fpcr_products, :pcr_gel_lanes, :pcr_gel_images
  
  scope :pendings, where(:status_id => Status.find_by_process_and_name(PcrGel.to_s,:pending))
  
  attr_accessible :user, :protocol, :status, :pcr_gel_images
  attr_accessible :user_id, :protocol_id, :status_id
  
  attr_accessible :spcr_products, :tpcr_products, :fpcr_products
  attr_accessible :spcr_product_ids, :tpcr_product_ids, :fpcr_product_ids
  attr_accessible :spcr_products_attributes, :tpcr_products_attributes, :fpcr_products_attributes
  attr_accessible :pcr_gel_lanes_attributes, :pcr_gel_images_attributes
    
end


