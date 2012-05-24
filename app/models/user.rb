class User < ActiveRecord::Base
  
  has_many :tasks
  has_many :parts, :through => :tasks
  
  has_many :spcrs
  has_many :tpcrs
  has_many :fpcrs
  has_many :fpcr_products, :through => :fpcrs
  has_many :pcr_gels
  has_many :ligations
  has_many :ligation_products
  
  attr_accessible :email, :fullname, :provider
  
  validates :fullname, :email, :presence => true
  
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth[:uid]
      user.fullname = auth[:info][:name]
      user.email = auth[:info][:email]
      user.provider = auth[:provider]
    end
  end
  
end
