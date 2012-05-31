class Admin::UsersController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
    @users = User.all
  end

  def show
    
  end

  def new
  end

  def edit
  end
end
