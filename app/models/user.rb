class User < ActiveRecord::Base
  
  has_many :tasks
  has_many :parts, :through => :tasks
  
  has_many :spcrs
  has_many :spcr_products, :through => :spcrs
  
  has_many :tpcrs
  has_many :tpcr_products, :through => :tpcrs
  
  has_many :fpcrs
  has_many :fpcr_products, :through => :fpcrs
  
  has_many :pcr_gels
  has_many :pcr_gel_lanes, :through => :pcr_gels

  has_many :ligations
  has_many :ligation_products, :through => :ligations
  
  has_many :transformations
  
  has_many :clonings
  has_many :clones, :through => :clonings
  
  has_many :cspcrs
  has_many :cspcr_products, :through => :cspcrs
  has_many :cspcr_plates, :through => :cspcrs
  
  has_many :cspcr_gels
  
  attr_accessible :email, :fullname, :provider
  
  validates :fullname, :email, :presence => true
  
  #utility method for creating an user at the first login
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth[:uid]
      user.fullname = auth[:info][:name]
      user.email = auth[:info][:email]
      user.provider = auth[:provider]
    end
  end
  
end
