class HomeController < ApplicationController
  skip_before_filter :is_valid_session?
    
  def index
  end
end
