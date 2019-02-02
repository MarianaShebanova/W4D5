class ApplicationController < ActionController::Base

  helper_method :login, :logout

  def login(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout
    session[:session_token] = nil
  end

  def current_user
    @current_user ||= User.find_by(session[:session_token])
  end

  def logged_in?
    !!current_user
  end
end
