class Admin::GroupsController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new 
  end
  
  def create
    @group = Group.new(params[:group])
    
    if @group.save
      redirect_to admin_group_path(@group), :notice => "Group created correctly."
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
  
    if @group.update_attributes(params[:group])
      redirect_to admin_group_path(@group), :notice => "Group updated updated."
    else
      render :edit
    end
  end
  
end
