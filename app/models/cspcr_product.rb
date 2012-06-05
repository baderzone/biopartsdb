class CspcrProduct < ActiveRecord::Base
  belongs_to :user
  belongs_to :cspcr
  belongs_to :quality_control
  belongs_to :clone
  
  has_many :cspcr_gel_lanes
  
  scope :for_user, lambda {|user| joins(:cspcr).where(:cspcrs => {:user_id => user.id})}
  
  scope :reaction_pass, where(:quality_control_id => QualityControl.find_by_process_and_name(Cspcr.to_s,:pass))
  scope :reaction_fail, where(:quality_control_id => QualityControl.find_by_process_and_name(Cspcr.to_s,:fail))

  scope :qc_pass, joins(:cspcr_gel_lanes).where(:cspcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(CspcrGelLane.to_s,:pass).id})
  scope :qc_fail, joins(:cspcr_gel_lanes).where(:cspcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(CspcrGelLane.to_s,:fail).id})
  
  attr_accessible :user, :cspcr, :quality_control, :clone, :quality_control_id  
  
  def to_s
    clone.name
  end
  
end
