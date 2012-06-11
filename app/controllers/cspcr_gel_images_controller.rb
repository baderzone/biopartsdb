class CspcrGelImagesController < ApplicationController

  def show
    @img = CspcrGelImage.find(params[:id])
  end

  def create
    @img = CspcrGelImage.new(params[:cspcr_gel_image])
    @img.cspcr_gel_id = params[:cspcr_gel_id]
    
    if @img.save
      redirect_to cspcr_gel_path(@img.cspcr_gel),:notice => "Image uploaded correctly"
    else
      flash[:error] = "Error while uploading the image"
      redirect_to cspcr_gel_path(@img.cspcr_gel)
    end
    
  end

end
