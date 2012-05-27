class CspcrGelLane < ActiveRecord::Base
  belongs_to :user
  belongs_to :cspcr_gel
  belongs_to :quality_control
  belongs_to :cspcr_product
  
  attr_accessible :quality_control_id
  
end
