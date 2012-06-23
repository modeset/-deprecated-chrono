class StatusesController < ApplicationController

  responders :flash, :http_cache, :collection

  before_filter :ensure_logged_in!

  respond_to :html, :json

  def index
    @status = Status.new
    @statuses = current_user.statuses
    respond_with :statuses
  end

  def create
    @status = current_user.statuses.create params[:status]
    respond_with :status
  end

end
