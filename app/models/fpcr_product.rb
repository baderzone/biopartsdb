class FpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :fpcr
  belongs_to :tpcr_product
  belongs_to :quality_control

  has_many :pcr_gel_lanes, :as => :pcr_product

  attr_accessible :user, :fpcr, :tpcr_product, :quality_control
  attr_accessible :user_id, :fpcr_id, :tpcr_product_id, :quality_control_id
  
  def to_label
    "#{tpcr_product.part.name}"
  end

end