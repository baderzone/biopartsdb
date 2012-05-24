class Part < ActiveRecord::Base
  belongs_to :location
  belongs_to :sequence
  belongs_to :feature

  has_many :tasks
  has_many :users, :through => :tasks

  has_many :oligos
  has_many :spcr_products
  
  attr_accessible :name, :location, :sequence, :feature
  
  def to_s
    name
  end
end
