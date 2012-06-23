class AddUserIdToStatuses < ActiveRecord::Migration
  def change
    change_table :statuses do |t|
      t.column :user_id, :integer
    end
  end
end
