class Clone < ActiveRecord::Base
  belongs_to :user
  belongs_to :transformation
  belongs_to :status
  belongs_to :quality_control
  belongs_to :protocol
  belongs_to :cloning
  
  attr_accessible :color, :name, :user, :user_id, :transformation, :transformation_id, :cloning, :status_id
  
end
