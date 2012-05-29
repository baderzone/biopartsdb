class Sequencing < ActiveRecord::Base
  belongs_to :user
  belongs_to :status

  has_many :sequencing_growth_plates  
  has_many :sequencing_products
  has_many :clones, :through => :sequencing_products
  
  accepts_nested_attributes_for :sequencing_products
  
  attr_accessible :sequencing_products, :status, :user
  attr_accessible :sequencing_product_ids,:clone_ids, :status_id, :sequencing_growth_plate_id
  attr_accessible :sequencing_products_attributes
  
end
