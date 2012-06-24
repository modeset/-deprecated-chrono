class StatusesController < ApplicationController

  responders :flash, :http_cache, :collection

  before_filter :ensure_logged_in!

  respond_to :html, :json

  def index
    @status = Status.new
    @statuses = current_user.statuses.where(:is_clock_out => false).order('created_at DESC')
    respond_with @statuses
  end

  def create
    @status = current_user.statuses.create params[:status]
    flash[:notice] = 'Status was created'
    respond_with @status, location: statuses_path
  end

  def destroy
    @status = current_user.statuses.find(params[:id])  
    @status.destroy
    flash[:notice] = 'Status was destroyed'
    respond_with @status
  end

end
