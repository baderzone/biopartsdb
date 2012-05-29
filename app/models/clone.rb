class Clone < ActiveRecord::Base
  belongs_to :user
  belongs_to :transformation
  belongs_to :status
  belongs_to :quality_control
  belongs_to :protocol
  belongs_to :cloning
  has_one :growth_plate_well
  
  has_many :cspcr_products
  has_many :cspcr_gel_lanes, :through => :cspcr_products

  scope :growing, where(:status_id => Status.find_by_process_and_name(Clone.to_s,:growing))
  scope :picked, where(:status_id => Status.find_by_process_and_name(Clone.to_s,:picked))

  scope :qc_pass, joins(:cspcr_products => :cspcr_gel_lanes).where(:cspcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(CspcrGelLane.to_s,:pass).id})
  scope :qc_fail, joins(:cspcr_products => :cspcr_gel_lanes).where(:cspcr_gel_lanes => {:quality_control_id => QualityControl.find_by_process_and_name(CspcrGelLane.to_s,:fail).id})

  attr_accessible :color, :name, :user, :user_id, :transformation, :transformation_id, :cloning, :status_id
  
end
