class Admin::HomeController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
    @count_users = User.all.size
    @count_plates = SequencingPlate.all.size
  end
end
