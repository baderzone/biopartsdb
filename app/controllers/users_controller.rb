class UsersController < ApplicationController
  def index
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(current_user.id) 
  end

  def edit
    #@user = User.find(params[:id])
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), :notice => "Info updated."
    else
      render action: "edit"
    end
  end
end
