class Organism < ActiveRecord::Base
  attr_accessible :gbtaxonid, :latin, :name
  
  validates :gbtaxonid, :latin, :name, :presence => true
  
end
