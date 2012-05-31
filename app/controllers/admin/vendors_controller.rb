class Admin::VendorsController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
    @vendors = Vendor.all
  end

  def show
    @vendor = Vendor.find(params[:id])
  end

  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(params[:vendor])
    
    if @vendor.save
      redirect_to admin_vendor_path(@vendor)
    else
      render :new
    end
    
  end

  def edit
    @vendor = Vendor.find(params[:id])
  end
  
  def update
    @vendor = Vendor.find(params[:id])
    
    if @vendor.update_attributes(params[:vendor])
      redirect_to admin_vendor_path(@vendor)
    else
      render :edit
    end
  end
end
