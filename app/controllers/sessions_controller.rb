class SessionsController < ApplicationController

  before_filter do
    Rails.logger.info auth_hash.inspect
  end

  def create
    user = User.find_or_create_from_auth_hash(auth_hash)
    session[:user_id] = user.id
    redirect_to '/'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
