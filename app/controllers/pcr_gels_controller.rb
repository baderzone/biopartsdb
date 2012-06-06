class PcrGelsController < ApplicationController

  def index
    @pcr_gels = current_user.pcr_gels
  end

  def show
    @pcr_gel = PcrGel.find(params[:id])
  end

  def new
    @pcr_gel = PcrGel.new
  end
  
  def create
    @pcr_gel = PcrGel.new(params[:pcr_gel])
    @pcr_gel.user = current_user
    @pcr_gel.status = Status.find_by_process_and_default(PcrGel.to_s, true)
    @pcr_gel.protocol = Protocol.find_by_process(PcrGel.to_s)

    if @pcr_gel.save
      redirect_to pcr_gel_path(@pcr_gel), :notice => "PCR Gel created correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@pcr_gel)
      render :new
    end
  end

  def edit
    @pcr_gel = PcrGel.find(params[:id])
    @quality_control = QualityControl.find_all_by_process(PcrGelLane.to_s)
    @statuses = Status.find_all_by_process(PcrGel.to_s)
  end
  
  def update
    @pcr_gel = PcrGel.find(params[:id])
    if @pcr_gel.update_attributes(params[:pcr_gel])
      redirect_to pcr_gel_path(@pcr_gel), :notice => "PCR Gel updated correctly."
    else
      render :edit, :id => @pcr_gel, :flash => {:error => "PCR Gel update error."}
    end
  end
  
  def sort
    params[:pcr_gel_lane].each_with_index do |id, index|
      PcrGelLane.update_all({position: index+1}, {id: id})
    end

   render :nothing => true
  end
  
  def update_all_qc_pass
    PcrGelLane.update_all({:quality_control_id => QualityControl.find_by_process_and_name(PcrGelLane.to_s,:pass).id}, {:pcr_gel_id => params[:id]})
    redirect_to edit_pcr_gel_path(@pcr_gel), :notice => "All lanes marked as passed."
  end
  
  def update_all_qc_fail
    PcrGelLane.update_all({:quality_control_id => QualityControl.find_by_process_and_name(PcrGelLane.to_s,:fail).id}, {:pcr_gel_id => params[:id]})
    redirect_to edit_pcr_gel_path(@pcr_gel), :notice => "All lanes marked as failed."
  end
  
end
