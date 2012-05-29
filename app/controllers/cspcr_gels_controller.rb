class CspcrGelsController < ApplicationController
  def index
    @cspcr_gels = current_user.cspcr_gels.order("id DESC")
  end

  def show
    @gel = CspcrGel.find(params[:id])
  end

  def new
    @gel = CspcrGel.new
  end
  
  def create
    @gel = CspcrGel.new(params[:cspcr_gel])
    @gel.user = current_user
    @gel.status = Status.find_by_process_and_default(CspcrGel.to_s, true)
    @gel.protocol = Protocol.find_by_process(CspcrGel.to_s)

    if @gel.save
      redirect_to cspcr_gel_path(@gel), :notice => "csPCR Gel created correctly."
    else
      render :new, :error => "csPCR Gel error."
    end
  end

  def edit
    @gel = CspcrGel.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(CspcrGelLane.to_s) 
    @statuses = Status.find_all_by_process(CspcrGel.to_s)
  end
  
  def update
    @gel = CspcrGel.find(params[:id])
    
    if @gel.update_attributes(params[:cspcr_gel])
      redirect_to cspcr_gel_path(@gel), :notice => "csPCR Gel created correctly."
    else
      render :new, :error => "csPCR Gel error."
    end
    
  end
  
end