class LigationProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :quality_control
  belongs_to :ligation
  belongs_to :plasmid
  belongs_to :pcr_product, :polymorphic => true
  
  accepts_nested_attributes_for :pcr_product
  
  attr_accessible :pcr_product, :quality_control, :ligation, :plasmid
  attr_accessible :quality_control_id, :ligation_id, :plasmid_id
  
end
