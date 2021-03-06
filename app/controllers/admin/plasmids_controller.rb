class Admin::PlasmidsController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  
  def index
    @plasmids = Plasmid.all
  end

  def show
    @plasmid = Plasmid.find(params[:id])
  end

  def new
    @plasmid = Plasmid.new
  end
  
  def create
    @plasmid = Plasmid.new(params[:plasmid])
    
    if @plasmid.save
      redirect_to admin_plasmid_path(@plasmid), :notice => "Plasmid created correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@plasmid)
      render :new
    end
  end

  def edit
    @plasmid = Plasmid.find(params[:id])
  end
  
  def update
    @plasmid = Plasmid.find(params[:id])

    if @plasmid.update_attributes(params[:plasmid])
      redirect_to admin_plasmid_path(@plasmid), :notice => "Plasmid updated correctly."
    else
      flash[:error] = "Error you forget something: " + get_model_error_message(@plasmid)
      render :edit
    end

  end
end
