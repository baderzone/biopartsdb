class CspcrsController < ApplicationController
  def index
    @cspcrs = current_user.cspcrs.order("id DESC")
  end

  def show
    @cspcr = Cspcr.find(params[:id])
  end

  def new
    @cspcr = Cspcr.new
  end

  def create
    @cspcr = Cspcr.new(params[:cspcr])
    @cspcr.user = current_user
    @cspcr.status = Status.find_by_process_and_default(Cspcr.to_s, true)
    @cspcr.protocol = Protocol.find_by_process(Cspcr.to_s)
    
    if @cspcr.save
      redirect_to cspcr_path(@cspcr), :notice => "aPCR created correctly."
    else
      render :new, :error => "aPCR error."
    end
  end
  
  def edit
    @cspcr = Cspcr.find(params[:id])
  end
  
  def update
    @cspcr = Cspcr.find(params[:id])
    if @cspcr.update_attributes(params[:cspcr])
      redirect_to cspcr_path(@cspcr), :notice => "csPCR updated correctly."
    else
      render :edit, :id => @cspcr, :error => "csPCR update error."
    end
  end
end
