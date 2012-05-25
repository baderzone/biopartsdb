class PcrGelImage < ActiveRecord::Base
  belongs_to :pcr_gel
  
  mount_uploader :pcr_gel_image_file, PcrGelImageFileUploader
    
  attr_accessible :pcr_gel_image_file, :pcr_gel_id

  validates :pcr_gel_image_file, :presence => :true

end
