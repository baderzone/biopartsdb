class UsersController < ApplicationController
  def index
    redirect_to user_path(current_user)
  end

  def show
    @user = User.find(current_user.id) 
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user])
      redirect_to user_path(@user), :notice => "User information updated."
    else
      render action: "edit", :flash => {:error => "Problem while updating user information."}
    end
  end
end
