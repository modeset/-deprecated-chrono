class RemoveSuperfluousTimestampsFromStatuses < ActiveRecord::Migration
  def change
    change_table :statuses do |t|
      t.remove :started_at
      t.remove :ended_at
    end
  end

end
