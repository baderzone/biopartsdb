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
      flash[:error] = "csPCR Gel error."
      flash[:error] = "Error you forget something: " + get_model_error_message(@gel)
      render :new
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
      render :new, :flash => {:error => "csPCR Gel error."}
    end
  end

  def sort
    params[:cspcr_gel_lane].each_with_index do |id, index|
      CspcrGelLane.update_all({position: index+1}, {id: id})
    end
    render :nothing => true
  end
  
  def update_all_qc_pass
    CspcrGelLane.update_all({:quality_control_id => QualityControl.find_by_process_and_name(CspcrGelLane.to_s,:pass).id}, {:cspcr_gel_id => params[:id]})
    redirect_to edit_cspcr_gel_path(params[:id]), :notice => "All lanes marked as passed."
  end
  
  def update_all_qc_fail
    CspcrGelLane.update_all({:quality_control_id => QualityControl.find_by_process_and_name(CspcrGelLane.to_s,:fail).id}, {:cspcr_gel_id => params[:id]})
    redirect_to edit_cspcr_gel_path(params[:id]), :notice => "All lanes marked as failed."
  end
  
  
end
