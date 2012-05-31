class GroupsUsers < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  # attr_accessible :title, :body
end
