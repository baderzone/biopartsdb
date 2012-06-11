class CspcrGel < ActiveRecord::Base
  belongs_to :user
  belongs_to :protocol
  belongs_to :status
  
  has_many :cspcr_gel_lanes
  has_many :cspcr_products, :through => :cspcr_gel_lanes

  has_many :cspcr_gel_images
  
  scope :pendings, where(:status_id => Status.find_by_process_and_name(CspcrGel.to_s,:pending))
    
  accepts_nested_attributes_for :cspcr_gel_lanes, :cspcr_gel_images
  
  attr_accessible :cspcr_gel_lanes, :cspcr_product_ids, :cspcr_gel_lanes_attributes, :status_id, :note
  
  validates :cspcr_products, :presence => :true
  
end
