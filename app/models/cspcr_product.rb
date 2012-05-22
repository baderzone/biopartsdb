class CspcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :tpcr
  belongs_to :quality_control
  belongs_to :part
 
  attr_accessible :part, :quality_control, :cspcr, :user
  attr_accessible :quality_control_id, :cspcr_id, :user_id

end
