class SpcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :spcr
  belongs_to :quality_control
  belongs_to :part
  
  has_many :pcr_gel_lanes, :as => :pcr_product
  has_many :pcr_gels, :through => :pcr_gel_lanes
  has_many :ligation_products, :as => :pcr_product
    
  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Spcr.to_s,:pass))
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Spcr.to_s,:fail))
  
  scope :qc_pass, joins(:pcr_gel_lanes).where(:pcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(PcrGelLane.to_s,:pass).id})
  scope :qc_fail, joins(:pcr_gel_lanes).where(:pcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(PcrGelLane.to_s,:fail).id})
  
  attr_accessible :part, :quality_control, :spcr, :user, :pcr_gel_lanes, :pcr_product
  attr_accessible :quality_control_id, :spcr_id, :user_id
  
  def to_s
    "#{part.name}"
  end
  
  def to_label
    "#{part.name} (sPCR, #{id})"
  end

end
