class CspcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :cspcr
  belongs_to :quality_control
  belongs_to :clone
  
  attr_accessible :user, :cspcr, :quality_control, :clone, :quality_control_id
end
