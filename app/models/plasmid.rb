class Plasmid < ActiveRecord::Base
  belongs_to :vendor
  attr_accessible :name
end