class Ligation < ActiveRecord::Base
  belongs_to :user
  belongs_to :plasmid
  belongs_to :status
  belongs_to :quality_control
  belongs_to :protocol
  belongs_to :pcr_product, :polymorphic => true
  
  accepts_nested_attributes_for :pcr_product, :quality_control, :status, :plasmid, :user, :protocol
  # attr_accessible :title, :body
end
