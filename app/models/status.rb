class Status < ActiveRecord::Base

  default_scope order('created_at DESC')

  attr_accessible :message

  belongs_to :user

  def duration_in_seconds
    if self.next_status.present?
      self.next_status.created_at - self.created_at
    else
      Time.zone.now - self.created_at
    end
  end

  def duration_in_minutes
    duration_in_minutes = duration_in_seconds / 1.minute
  end

  def duration_in_hours(rounded_to = 15.0)
    hours = (duration_in_minutes / 60).floor
    round_quantity =  ((duration_in_minutes % 60) / rounded_to).round
    round_quantity * (rounded_to / 60.0)
  end

  def previous_status
    self.user.statuses.where('created_at < ?', self.created_at).order('created_at DESC').first
  end

  def next_status
    self.user.statuses.where('created_at > ?', self.created_at).order('created_at ASC').first
  end

  def current?
    next_status.nil?
  end

end
