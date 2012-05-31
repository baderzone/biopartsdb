class SessionsController < ApplicationController
  skip_before_filter :is_valid_session?
  
  def create
    auth = request.env['omniauth.auth']    
    user = User.find_by_provider_and_email(auth[:provider],auth[:info][:email]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => "Signed in!"
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
