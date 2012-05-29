class Transformation < ActiveRecord::Base
  belongs_to :user
  belongs_to :ligation_product
  belongs_to :strain
  belongs_to :status
  belongs_to :quality_control
  belongs_to :protocol
  
  attr_accessible :blue_count, :light_blue_count, :white_count, :strain, :ligation_product
  attr_accessible :ligation_product_id, :strain_id, :status_id, :quality_control_id
  
  validates :ligation_product, :strain, :presence => :true
    
end
