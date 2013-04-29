class CspcrGelImage < ActiveRecord::Base
  belongs_to :cspcr_gel
  has_many :cspcr_gel_image_annotations

  mount_uploader :cspcr_gel_image_file, CspcrGelImageFileUploader
  
  attr_accessible :cspcr_gel_image_file, :cspcr_gel_id
  
  validates :cspcr_gel_image_file, :presence => :true

end
