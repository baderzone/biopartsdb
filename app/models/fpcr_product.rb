class FpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :fpcr
  belongs_to :tpcr_product
  belongs_to :quality_control
  
  has_many :pcr_gel_lanes, :as => :pcr_product
  has_many :pcr_gels, :through => :pcr_gel_lanes
  has_many :ligation_products, :as => :pcr_product
  has_many :transformations, :through => :ligation_products, :as => :pcr_product

  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Fpcr.to_s,:pass))
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Fpcr.to_s,:fail))
  
  scope :qc_pass, joins(:pcr_gel_lanes).where(:pcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(PcrGelLane.to_s,:pass).id})
  scope :qc_fail, joins(:pcr_gel_lanes).where(:pcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(PcrGelLane.to_s,:fail).id})
  
  attr_accessible :user, :fpcr, :tpcr_product, :quality_control, :pcr_gel_lanes, :pcr_product
  attr_accessible :user_id, :fpcr_id, :tpcr_product_id, :quality_control_id
  
  def part
    tpcr_product.part
  end

  def name
    "#{tpcr_product.part.name} (#{id})"
  end
  
  def to_s
    "#{tpcr_product.part.name}"
  end
  
  def to_label
    "#{tpcr_product.part.name} (fPCR, #{id})"
  end

end
