class TpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :tpcr
  belongs_to :quality_control
  belongs_to :part

  attr_accessible :part, :quality_control, :tpcr, :user
  attr_accessible :quality_control_id, :tpcr_id, :user_id

end
