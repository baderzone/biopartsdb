class Cloning < ActiveRecord::Base
  belongs_to :user
  belongs_to :growth_plate
  belongs_to :protocol
  
  has_many :clones, :dependent => :destroy
  
  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Ligation.to_s,:pass).id)
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Ligation.to_s,:fail).id)
  
  accepts_nested_attributes_for :clones

  attr_accessible :user, :growth_plate, :protocol
  attr_accessible :clones_ids, :clones_attributes
  
end
