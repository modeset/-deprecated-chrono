require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  helper_method :current_user

  protect_from_forgery

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in!
    redirect_to '/auth/github' unless current_user
  end

end
