class SequencingProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :sequencing
  belongs_to :part
  belongs_to :clone
  belongs_to :quality_control
  
  scope :for_user, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id})}
  
  scope :qc_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :pass).id)
  scope :qc_pass_for, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id}, :quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :pass).id)}

  scope :qc_fixable, where(:quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :fixable).id)
  scope :qc_fixable_for, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id}, :quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :fixable).id)}

  scope :qc_check, where(:quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :check).id)
  scope :qc_check_for, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id}, :quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :check).id)}

  scope :qc_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :fail).id)
  scope :qc_fail_for, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id}, :quality_control_id => QualityControl.find_by_process_and_name(Sequencing.to_s, :fail).id)}

  scope :no_qc, where(:quality_control_id => nil)
  scope :no_qc_for, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id}, :quality_control_id => nil)}

  attr_accessible :user, :sequencing, :part, :clone, :quality_control
  attr_accessible :user_id, :sequencing_id, :part_id, :clone_id, :quality_control_id
  
  
end
