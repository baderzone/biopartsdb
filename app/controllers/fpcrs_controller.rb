class FpcrsController < ApplicationController
  def index
    @fpcrs = current_user.fpcrs.order("id DESC")
  end

  def show
    @fpcr = Fpcr.find(params[:id])
  end
  
  def new
    @fpcr = Fpcr.new
    @devices = DeviceType.find_by_value(:pcr).devices
  end

  def create
    @fpcr = Fpcr.new(params[:fpcr])
    @fpcr.user = current_user
    @fpcr.status = Status.find_by_process_and_default(Fpcr.to_s, true)
    @fpcr.protocol = Protocol.find_by_process(Fpcr.to_s)
    
    if @fpcr.save
      redirect_to fpcr_path(@fpcr), :notice => "fPCR created correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@fpcr)
      render :new
    end
  end

  def edit
    @fpcr = Fpcr.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(Fpcr.to_s)
    @statuses = Status.find_all_by_process(Fpcr.to_s)
  end

  def update
    @fpcr = Fpcr.find(params[:id])
    if @fpcr.update_attributes(params[:fpcr])
      redirect_to fpcr_path(@fpcr), :notice => "fPCR updated correctly."
    else
      render :edit, :id => @fpcr, :flash => {:error => "fPCR update error."} 
    end
  end
  
  def update_all_qc_pass
    FpcrProduct.update_all({:quality_control_id => QualityControl.find_by_process_and_name(Fpcr.to_s,:pass).id}, {:fpcr_id => params[:id]})
    redirect_to edit_fpcr_path(@fpcr), :notice => "All fPCR products marked as passed."
  end
  
  def update_all_qc_fail
    FpcrProduct.update_all({:quality_control_id => QualityControl.find_by_process_and_name(Fpcr.to_s,:fail).id}, {:fpcr_id => params[:id]})
    redirect_to edit_fpcr_path(@fpcr), :notice => "All fPCR products marked as failed."
  end
end
