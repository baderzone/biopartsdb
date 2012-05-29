class Ligation < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :protocol
  
  has_many :ligation_products
  has_many :spcr_products, :through => :ligation_products, :source => :pcr_product, :source_type => "SpcrProduct"
  has_many :fpcr_products, :through => :ligation_products, :source => :pcr_product, :source_type => "FpcrProduct"
    
  accepts_nested_attributes_for :spcr_products, :fpcr_products, :ligation_products

  attr_accessible :user, :plasmid, :protocol, :status
  attr_accessible :user_id, :plasmid_id, :protocol_id, :status_id
  
  attr_accessible :spcr_products, :fpcr_products
  attr_accessible :spcr_product_ids, :fpcr_product_ids
  attr_accessible :spcr_products_attributes, :fpcr_products_attributes, :ligation_products_attributes


end
