class ApcrsController < ApplicationController
  def index
    @apcrs = current_user.apcrs.order("id DESC")
  end

  def show
    @apcr = Apcr.find(params[:id])
  end

  def new
    @apcr = Apcr.new
  end

  def create
    @apcr = Apcr.new(params[:apcr])
    @apcr.user = current_user
    @apcr.status = Status.find_by_process_and_default(Apcr.to_s, true)
    @apcr.protocol = Protocol.find_by_process(Apcr.to_s)
    
    if @apcr.save
      redirect_to apcr_path(@apcr), :notice => "aPCR created correctly."
    else
      render :new, :error => "aPCR error."
    end
  end
  
  def edit
    @apcr = Apcr.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(Apcr.to_s)
    @statuses = Status.find_all_by_process(Apcr.to_s)
  end
  
  def update
    @apcr = Apcr.find(params[:id])
    if @apcr.update_attributes(params[:apcr])
      redirect_to apcr_path(@apcr), :notice => "aPCR updated correctly."
    else
      render :edit, :id => @apcr, :error => "aPCR update error."
    end
  end
end
