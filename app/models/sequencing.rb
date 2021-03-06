class Sequencing < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :protocol
  
  has_many :sequencing_growth_plates  
  has_many :sequencing_products
  has_many :clones, :through => :sequencing_products
  
  accepts_nested_attributes_for :sequencing_products
  
  attr_accessible :sequencing_products, :status, :user
  attr_accessible :sequencing_product_ids,:clone_ids, :status_id, :sequencing_growth_plate_id
  attr_accessible :sequencing_products_attributes
  
  
  def index_by_part
    parts = Hash.new
    sequencing_products.each do |rxn|
      (parts[rxn.part] ||= []) << rxn
    end
    return parts
  end
  
  
end
