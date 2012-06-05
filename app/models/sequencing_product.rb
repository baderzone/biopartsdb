class SequencingProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :sequencing
  belongs_to :part
  belongs_to :clone
  belongs_to :quality_control
  
  scope :for_user, lambda {|user| joins(:sequencing).where(:sequencings => {:user_id => user.id})}
  
  attr_accessible :user, :sequencing, :part, :clone, :quality_control
  attr_accessible :user_id, :sequencing_id, :part_id, :clone_id, :quality_control_id
end
