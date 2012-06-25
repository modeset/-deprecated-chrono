class OrganizationsController < ApplicationController

  before_filter :ensure_logged_in!

  respond_to :html, :json

  def index
    @organizations = current_user.organizations
  end

end
