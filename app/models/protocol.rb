class Protocol < ActiveRecord::Base
  belongs_to :user
  attr_accessible :process, :content, :name
end
