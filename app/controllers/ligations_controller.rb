class LigationsController < ApplicationController
  def index
    @ligations = current_user.ligations.order("id DESC")
  end

  def show
    @ligation = Ligation.find(params[:id])
  end

  def new
    @ligation = Ligation.new
  end
  
  def create
    @ligation = Ligation.new(params[:ligation])
    @ligation.user = current_user
    @ligation.status = Status.find_by_process_and_default(Ligation.to_s, true)
    @ligation.protocol = Protocol.find_by_process(Ligation.to_s)

    if @ligation.save
      redirect_to ligation_path(@ligation), :notice => "Ligations created correctly."
    else
      render :new, :error => "Ligation error."
    end
  end

  def edit
    @ligation = Ligation.find(params[:id])
    @quality_controls = QualityControl.find_all_by_process(Ligation.to_s)
    @statuses = Status.find_all_by_process(Ligation.to_s)
  end
  
  def update
    @ligation = Ligation.find(params[:id])
    if @ligation.update_attributes(params[:ligation])
      redirect_to ligation_path(@ligation), :notice => "Ligation updated correctly."
    else
      render :edit, :id => @ligation, :error => "Ligation update error."
    end
  end
  
end
