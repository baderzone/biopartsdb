class PcrGelImagesController < ApplicationController
  def create
    @img = PcrGelImage.new(params[:pcr_gel_image])
    @img.pcr_gel_id = params[:pcr_gel_id]
    
    if @img.save
      redirect_to pcr_gel_path(@img.pcr_gel),:notice => "Image uploaded correctly"
    else
      flash[:error] = "Error while uploading the image"
      redirect_to pcr_gel_path(@img.pcr_gel)
    end
    
  end
end
