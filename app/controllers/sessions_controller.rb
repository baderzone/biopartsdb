class SessionsController < ApplicationController
  skip_before_filter :is_valid_session?

  def create
    auth = request.env['omniauth.auth']    
    #user = User.find_by_email(auth[:info][:email]) || User.create_with_omniauth(auth)
    user = User.find_by_email(auth[:info][:email])
    if user.nil?
      flash[:error] = "Sorry, only registered users can access this website"
      return redirect_to root_url
    else
      session[:user_id] = user.id
      return redirect_to root_url, :notice => "Signed in!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
