class Part < ActiveRecord::Base
  belongs_to :location
  belongs_to :sequence
  belongs_to :feature

  has_many :tasks
  has_many :users, :through => :tasks

  has_many :oligos
  has_many :oligo_plate_wells, :through => :oligos
  has_many :oligo_plates, :through => :oligo_plate_wells
  
  has_many :spcr_products
  has_many :tpcr_products
  has_many :fpcr_products, :through => :tpcr_products
  
  has_many :ligation_products
  has_many :transformations, :through => :ligation_products
  has_many :clones, :through => :transformations
  
  attr_accessible :name, :location, :sequence, :feature
  
  def to_s
    name
  end
      
end
