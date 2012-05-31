class Group < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  attr_accessible :description, :name
  attr_accessible :user_ids
end
