class PcrGelLane < ActiveRecord::Base
  belongs_to :pcr_gel
  belongs_to :quality_control
  
  belongs_to :pcr_product, :polymorphic => true
  
  attr_accessible :pcr_product, :quality_control, :pcr_gel
end
