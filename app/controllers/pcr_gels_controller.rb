class PcrGelsController < ApplicationController
  def index
    @pcr_gels = current_user.pcr_gels
  end

  def show
  end

  def new
    @pcr_gel = PcrGel.new
  end
  
  def create
  end

  def edit
  end
  
  def update
  end
  
end
