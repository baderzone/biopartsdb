class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :is_valid_session?
  
  helper_method :current_user
  helper_method :get_model_error_message
      
  private

    def is_valid_session?
      if session[:user_id].nil?
        flash[:error] = "Login required."
        redirect_to root_url
      end
    end
    
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
