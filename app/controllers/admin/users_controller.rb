class Admin::UsersController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(params[:user])
      redirect_to admin_user_path(@user)
    else
      render :edit
    end
    
  end
end
