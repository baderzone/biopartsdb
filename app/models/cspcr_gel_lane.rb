class CspcrGelLane < ActiveRecord::Base
  acts_as_list
  
  belongs_to :user
  belongs_to :cspcr_gel
  belongs_to :quality_control
  belongs_to :cspcr_product
  
  attr_accessible :quality_control_id
  
end
