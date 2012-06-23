class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.string :message
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
