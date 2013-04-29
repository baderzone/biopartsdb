class PcrGelImageAnnotationsController < ApplicationController
  load_and_authorize_resource

  def index
    @annotations = PcrGelImageAnnotation.find_all_by_pcr_gel_image_id(params[:pcr_gel_image_id])
  end
  
  def new
    @img = PcrGelImage.find(params[:pcr_gel_image_id])
    @annotation = PcrGelImageAnnotation.new
    @labels = Array.new
    @labels << 'ladder'
    @labels << 'positive control'
    @labels << 'negative control'
    PcrGelLane.find_all_by_pcr_gel_id(@img.pcr_gel_id).each do |lane|
      @labels << "#{lane.pcr_product.part.name} (#{lane.pcr_product.part.length})"
    end
  end 

  def create
    @img = PcrGelImage.find(params[:pcr_gel_image_id])
    @annotation = @img.pcr_gel_image_annotations.build(params[:pcr_gel_image_annotation])
    @annotation.position = params[:position]
    @annotation.save
    redirect_to pcr_gel_pcr_gel_image_path(@img.pcr_gel_id, @img.id), :notice => "Annotation Added!"
  end

  def destroy
    @img = PcrGelImage.find(params[:pcr_gel_image_id])
    @annotation = PcrGelImageAnnotation.find(params[:id])
    @annotation.destroy
    redirect_to pcr_gel_pcr_gel_image_path(@img.pcr_gel_id, @img.id) 
  end

end
