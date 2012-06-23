class ProfilesController < ApplicationController

  before_filter :ensure_logged_in!

  respond_to :html, :json

  def show
    @user = current_user
    respond_with @user
  end

end
