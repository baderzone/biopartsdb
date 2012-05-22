class FpcrsController < ApplicationController
  def index
    @fpcrs = current_user.fpcrs.order("id DESC")
  end

  def show
    @fpcr = Fpcr.find(params[:id])
  end
  
  def new
    @fpcr = Fpcr.new
  end

  def create
    @fpcr = Fpcr.new(params[:fpcr])
    @fpcr.user = current_user
    @fpcr.status = Status.find_by_process_and_default(Fpcr.to_s, true)
    @fpcr.protocol = Protocol.find_by_process(Fpcr.to_s)

    if @fpcr.save
      redirect_to fpcr_path(@fpcr), :notice => "fPCR created correctly."
    else
      render :new, :error => "fPCR error."
    end
  end

  def edit
    @fpcr = Fpcr.find(params[:id])
  end

  def update
    @fpcr = Fpcr.find(params[:id])
    if @fpcr.update_attributes(params[:fpcr])
      redirect_to fpcr_path(@fpcr), :notice => "fPCR updated correctly."
    else
      render :edit, :id => @fpcr, :error => "fPCR update error."
    end
  end
end
