class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :is_valid_session?
  
  helper_method :current_user
  helper_method :get_model_error_message
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :flash => {:error => "You are not allowed to perform this operation. Your action has been recorded!"}
  end
      
  private

    def is_valid_session?
      if session[:user_id].nil?
        redirect_to root_url, :flash => { :error => "Login required." }
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
