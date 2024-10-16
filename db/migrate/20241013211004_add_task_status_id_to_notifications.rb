class AddTaskStatusIdToNotifications < ActiveRecord::Migration[7.1]
  def change
    add_column :notifications, :task_status_id, :integer
  end
end