class Admin::StrainsController < ApplicationController
  
  authorize_resource :class => :admin
  
  layout 'admin'

  def index
    @strains = Strain.all
  end

  def show
    @strain = Strain.find(params[:id])
  end

  def new
    @strain = Strain.new
  end
  
  def create
    @strain = Strain.new(params[:strain])
    
    if @strain.save 
      redirect_to admin_strain_path(@strain), :notice => "Strain created successfully."
    else
      render :new
    end
    
  end

  def edit
    @strain = Strain.find(params[:id])
  end
  
  def update
    @strain = Strain.find(params[:id])
    
    if @strain.update_attributes(params[:strain])
      redirect_to admin_strain_path(@strain), :notice => "Strain created successfully."
    else
      render :edit
    end
  
  end
end
