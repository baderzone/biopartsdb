class ApcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :apcr
  belongs_to :quality_control
  belongs_to :part
  
  attr_accessible :part, :quality_control, :apcr, :user
  attr_accessible :quality_control_id, :apcr_id, :user_id

end
