class Transformation < ActiveRecord::Base
  belongs_to :user
  belongs_to :ligation_product
  belongs_to :strain
  belongs_to :status
  belongs_to :quality_control
  belongs_to :protocol
  
  has_many :clones
  
  scope :for_user, lambda {|user| where(:user_id => user.id)}
  
  #fast status query scope
  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Transformation.to_s,:pass).id)
  scope :reaction_pass_for, lambda {|user| where(:quality_control_id => QualityControl.find_by_process_and_name(Transformation.to_s,:pass).id, :user_id => user.id)}
  
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Transformation.to_s,:fail).id)  
  scope :reaction_fail_for, lambda {|user| where(:quality_control_id => QualityControl.find_by_process_and_name(Transformation.to_s,:fail).id, :user_id => user.id)}
  
  scope :pendings, where(:status_id => Status.find_by_process_and_name(Transformation.to_s,:pending))
  scope :pending_for, lambda {|user| where(:status_id => Status.find_by_process_and_name(Transformation.to_s,:pending), :user_id => user.id)}
  
  attr_accessible :blue_count, :light_blue_count, :white_count, :strain, :ligation_product
  attr_accessible :ligation_product_id, :strain_id, :status_id, :quality_control_id
  
  validates :ligation_product, :strain, :presence => :true
  validates :white_count, :blue_count, :light_blue_count, :numericality => { :only_integer => true, :message => "Must be an integer" }
    
end
