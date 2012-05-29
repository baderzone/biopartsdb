class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all
  helper_method :current_user
  helper_method :get_model_error_message
  
  private
    
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def get_model_error_message(record)
    msg = ""
    record.errors.full_messages.each do |err|
      msg += "#{err}. "
    end
    
    return msg
  end
  
end
