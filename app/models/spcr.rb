class Spcr < ActiveRecord::Base
  belongs_to :user
  belongs_to :status
  belongs_to :protocol
  belongs_to :device
  
  has_many :spcr_products, :dependent => :destroy
  has_many :parts, :through => :spcr_products
  
  scope :pendings, where(:status_id => Status.find_by_process_and_name(Spcr.to_s,:pending))
    
  accepts_nested_attributes_for :spcr_products
  
  attr_accessible :parts, :device, :status, :protocol, :note
  attr_accessible :part_ids, :device_id, :status_id, :protocol_id, :spcr_products_attributes
  
  validates :device, :parts, :status, :protocol, :presence => true

end
