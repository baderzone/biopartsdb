class PcrGelImageAnnotation < ActiveRecord::Base
  belongs_to :pcr_gel_image
  
  attr_accessible :label, :pcr_gel_image_id, :position
  attr_accessible :pcr_gel_image

end
