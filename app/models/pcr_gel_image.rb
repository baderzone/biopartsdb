class PcrGelImage < ActiveRecord::Base
  belongs_to :pcr_gel
  has_many :pcr_gel_image_annotations

  mount_uploader :pcr_gel_image_file, PcrGelImageFileUploader
    
  attr_accessible :pcr_gel_image_file, :pcr_gel_id

  validates :pcr_gel_image_file, :presence => :true

end
