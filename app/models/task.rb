class Task < ActiveRecord::Base
  belongs_to :user
  belongs_to :part
  
  attr_accessible :user_id, :part_id
end
