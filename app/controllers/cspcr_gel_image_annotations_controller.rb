class CspcrGelImageAnnotationsController < ApplicationController
  load_and_authorize_resource

  def index
    @annotations = CspcrGelImageAnnotation.find_all_by_cspcr_gel_image_id(params[:cspcr_gel_image_id])
  end

  def new
    @img = CspcrGelImage.find(params[:cspcr_gel_image_id])
    @annotation = CspcrGelImageAnnotation.new
    @labels = Array.new
    @labels << 'ladder'
    @labels << 'positive control'
    @labels << 'negative control'
    CspcrGelLane.find_all_by_cspcr_gel_id(@img.cspcr_gel_id).each do |lane|
      @labels << "#{lane.cspcr_product.to_s} (#{lane.cspcr_product.clone.part.length})"
    end
  end 

  def create
    @img = CspcrGelImage.find(params[:cspcr_gel_image_id])
    @annotation = @img.cspcr_gel_image_annotations.build(params[:cspcr_gel_image_annotation])
    @annotation.position = params[:position]
    @annotation.save
    redirect_to cspcr_gel_cspcr_gel_image_path(@img.cspcr_gel_id, @img.id)
  end

  def destroy
    @img = CspcrGelImage.find(params[:cspcr_gel_image_id])
    @annotation = CspcrGelImageAnnotation.find(params[:id])
    @annotation.destroy
    redirect_to cspcr_gel_cspcr_gel_image_path(@img.cspcr_gel_id, @img.id) 
  end

end
