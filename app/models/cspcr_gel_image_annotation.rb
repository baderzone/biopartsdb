class CspcrGelImageAnnotation < ActiveRecord::Base
  belongs_to :cspcr_gel_image
  
  attr_accessible :label, :cspcr_gel_image_id, :position
  attr_accessible :cspcr_gel_image

end
