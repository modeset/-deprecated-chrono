class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in!
    redirect_to '/auth/github' unless current_user
  end

end
