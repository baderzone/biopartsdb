class Admin::DevicesController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'

  def index
    @devices = Device.all
  end

  def show
    @device = Device.find(params[:id])
  end

  def new
    @device = Device.new
  end
  
  def create
    @device = Device.new(params[:device])
    
    if @device.save
      redirect_to admin_device_path(@device), :notice => "Device created correctly." 
    else
      render :new
    end
    
  end

  def edit
    @device = Device.find(params[:id])
  end
  
  def update
    @device = Device.find(params[:id])
    
    if @device.update_attributes(params[:device])
      redirect_to admin_device_path(@device), :notice => "Device updated correctly." 
    else
      render :edit
    end
  end
  
end
