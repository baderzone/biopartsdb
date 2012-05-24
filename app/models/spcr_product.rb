class SpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :spcr
  belongs_to :quality_control
  belongs_to :part
  
  has_many :pcr_gel_lanes, :as => :pcr_product

  has_many :ligations, :as => :pcr_product
  
  attr_accessible :part, :quality_control, :spcr, :user, :pcr_gel_lanes, :pcr_product
  attr_accessible :quality_control_id, :spcr_id, :user_id
  
  def to_s
    "#{part.name} (#{id})"
  end
  
  def to_label
    "#{part.name} (sPCR, #{id})"
  end

end