class AddIsClockOutToStatuses < ActiveRecord::Migration
  def change
    add_column :statuses, :is_clock_out, :boolean, :null => false, :default => false
  end
end
