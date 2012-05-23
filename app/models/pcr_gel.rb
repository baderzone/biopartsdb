class PcrGel < ActiveRecord::Base
  belongs_to :user
  belongs_to :protocol
  belongs_to :status
  
  has_many :pcr_gel_lanes
  has_many :pcr_products, :through => :students, :source => :posts
  # attr_accessible :title, :body
end
