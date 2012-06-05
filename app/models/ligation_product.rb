class LigationProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :part
  belongs_to :quality_control
  belongs_to :ligation
  belongs_to :plasmid
  belongs_to :pcr_product, :polymorphic => true
  
  has_many :transformations
  has_many :clones, :through => :transformations
  
  scope :for_user, lambda {|user| joins(:ligation).where(:ligations => {:user_id => user.id})}
  
  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Ligation.to_s,:pass).id)
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Ligation.to_s,:fail).id)
  
  accepts_nested_attributes_for :pcr_product
  
  attr_accessible :pcr_product, :quality_control, :ligation, :plasmid, :part
  attr_accessible :quality_control_id, :ligation_id, :plasmid_id
  
  def to_s
    "#{pcr_product.to_s} (#{id})"
  end
  
  def to_label
    "#{pcr_product.to_label} (#{id})"
  end
end
