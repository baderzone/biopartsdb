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
    @devices = DeviceType.find_by_value(:pcr).devices
  end

  def create
    @spcr = Spcr.new(params[:spcr])
    @spcr.user = current_user
    @spcr.status = Status.find_by_process_and_default(Spcr.to_s, true)
    @spcr.protocol = Protocol.find_by_process(Spcr.to_s)
    
    if @spcr.save
      redirect_to spcr_path(@spcr), :notice => "spcr created correctly."
    else
      render :new, :error => "spcr error."
    end
  end
  
  def edit
    @spcr = Spcr.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(spcr.to_s)
    @statuses = Status.find_all_by_process(spcr.to_s)
  end
  
  def update
    @spcr = Spcr.find(params[:id])
    if @spcr.update_attributes(params[:spcr])
      redirect_to spcr_path(@spcr), :notice => "spcr updated correctly."
    else
      render :edit, :id => @spcr, :error => "spcr update error."
    end
  end
end
