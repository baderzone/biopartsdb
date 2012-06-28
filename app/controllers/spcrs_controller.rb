class SpcrsController < ApplicationController

  def index
    @spcrs = current_user.spcrs.order("id DESC")
  end

  def show
    @spcr = Spcr.find(params[:id])
    @markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, :autolink => true, :space_after_headers => true)
  end

  def new
    @spcr = Spcr.new
    @protocols = Protocol.find_all_by_process(Spcr.to_s)
    @devices = DeviceType.find_by_value(:pcr).devices
  end

  def create
    @spcr = Spcr.new(params[:spcr])
    @spcr.user = current_user
    @spcr.status = Status.find_by_process_and_default(Spcr.to_s, true)
    
    if @spcr.save
      redirect_to spcr_path(@spcr), :notice => "spcr created correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@spcr)
      render :new
    end
  end
  
  def edit
    @spcr = Spcr.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(Spcr.to_s)
    @protocols = Protocol.find_all_by_process(Spcr.to_s)
    @statuses = Status.find_all_by_process(Spcr.to_s)
  end
  
  def update
    @spcr = Spcr.find(params[:id])
    if @spcr.update_attributes(params[:spcr])
      redirect_to spcr_path(@spcr), :notice => "sPCR updated correctly."
    else
      render :edit, :id => @spcr, :flash => {:error => "sPCR update error."}
    end
  end
  
  def update_all_qc_pass
    SpcrProduct.update_all({:quality_control_id => QualityControl.find_by_process_and_name(Spcr.to_s,:pass).id}, {:spcr_id => params[:id]})
    redirect_to edit_spcr_path(params[:id]), :notice => "All sPCR products marked as passed."
  end
  
  def update_all_qc_fail
    SpcrProduct.update_all({:quality_control_id => QualityControl.find_by_process_and_name(Spcr.to_s,:fail).id}, {:spcr_id => params[:id]})
    redirect_to edit_spcr_path(params[:id]), :notice => "All sPCR products marked as failed."
  end
end
