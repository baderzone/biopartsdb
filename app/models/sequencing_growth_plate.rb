class SequencingGrowthPlate < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name
end
