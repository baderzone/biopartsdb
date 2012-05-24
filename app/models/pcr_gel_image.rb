class PcrGelImage < ActiveRecord::Base
  belongs_to :pcr_gel
  
  mount_uploader :pcr_gel_image_file, PcrGelImageFileUploader
  
  validates :pcr_gel_image_file, :presence => :true
  attr_accessible :pcr_gel_image_file, :pcr_gel_id
  # attr_accessible :title, :body
end
