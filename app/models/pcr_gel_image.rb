class PcrGelImage < ActiveRecord::Base
  belongs_to :pcr_gel
  
  mount_uploader :pcr_gel_image_file, PcrGelImageFile
  
  # attr_accessible :title, :body
end
