class SequencingGrowthPlate < ActiveRecord::Base
  belongs_to :user
  belongs_to :sequencing
  attr_accessible :name, :user
end
