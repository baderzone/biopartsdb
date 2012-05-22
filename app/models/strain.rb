class Strain < ActiveRecord::Base
  belongs_to :organism
  belongs_to :vendor
  attr_accessible :name
end
