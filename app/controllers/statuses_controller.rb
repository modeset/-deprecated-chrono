class StatusesController < ApplicationController

  responders :flash, :http_cache, :collection

  before_filter :ensure_logged_in!

  respond_to :html, :json

  def index
    @status_groups = current_user.statuses.order('created_at DESC').group_by { |s| s.ended_at.at_beginning_of_day }
    respond_with @statuses
  end

  def create
    @status = current_user.statuses.create params[:status]
    flash[:notice] = 'Status was created'
    respond_with @status, location: statuses_path
  end

  def edit
    @status = current_user.statuses.find(params[:id])
    respond_with @status
  end

  def update
    @status = current_user.statuses.find(params[:id])
    @status.update_attributes params[:status]
    respond_with @status
  end

  def destroy
    @status = current_user.statuses.find(params[:id])  
    @status.destroy
    flash[:notice] = 'Status was destroyed'
    respond_with @status
  end

end
