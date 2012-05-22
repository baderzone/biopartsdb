class Location < ActiveRecord::Base
  belongs_to :organism
  attr_accessible :organism, :chromosome, :start, :stop, :strand
end
