class LigationProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :quality_control
  belongs_to :ligation
  belongs_to :plasmid
  belongs_to :pcr_product, :polymorphic => true
  
  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Ligation.to_s,:pass).id)
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Ligation.to_s,:fail).id)
  
  accepts_nested_attributes_for :pcr_product
  
  attr_accessible :pcr_product, :quality_control, :ligation, :plasmid
  attr_accessible :quality_control_id, :ligation_id, :plasmid_id
  
  def to_s
    pcr_product.to_s
  end
  
  validates :plasmid, :presence => :true
  
end
