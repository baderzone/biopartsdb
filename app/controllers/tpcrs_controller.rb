class TpcrsController < ApplicationController
  def index
    @tpcrs = current_user.tpcrs.order("id DESC")
  end

  def show
    @tpcr = Tpcr.find(params[:id])
  end

  def new
    @tpcr = Tpcr.new
    @devices = DeviceType.find_by_value(:pcr).devices
  end

  def create
    @tpcr = Tpcr.new(params[:tpcr])
    @tpcr.user = current_user
    @tpcr.status = Status.find_by_process_and_default(Tpcr.to_s, true)
    @tpcr.protocol = Protocol.find_by_process(Tpcr.to_s)
    
    if @tpcr.save
      redirect_to tpcr_path(@tpcr), :notice => "tPCR created correctly."
    else
      render :new, :flash => {:error => "Error you forget something: " + get_model_error_message(@tpcr)}
    end
  end
  
  def edit
    @tpcr = Tpcr.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(Tpcr.to_s)
    @statuses = Status.find_all_by_process(Tpcr.to_s)
  end
  
  def update
    @tpcr = Tpcr.find(params[:id])
    if @tpcr.update_attributes(params[:tpcr])
      redirect_to tpcr_path(@tpcr), :notice => "tPCR updated correctly."
    else
      render :edit, :id => @tpcr, :flash => {:error => "tPCR update error."}
    end
  end
end
