class Admin::HomeController < ApplicationController
  authorize_resource :class => :admin
  
  layout 'admin'
  
  def index
  end
end
