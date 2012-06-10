class PcrGelImagesController < ApplicationController
  
  def show
    @img = PcrGelImage.find(params[:id])
  end
  
  def create
    @img = PcrGelImage.new(params[:pcr_gel_image])
    @img.pcr_gel_id = params[:pcr_gel_id]
    
    if @img.save
      redirect_to pcr_gel_path(@img.pcr_gel),:notice => "Image uploaded correctly"
    else
      redirect_to pcr_gel_path(@img.pcr_gel), :flash => {:error => "Error while uploading the image"}
    end
    
  end
end
