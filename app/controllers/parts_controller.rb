class PartsController < ApplicationController
  def index
    @parts = current_user.parts
  end

  def show
    @part = Part.find(params[:id])
  end
  
  def status
    @parts = current_user.parts
  end
  
end
