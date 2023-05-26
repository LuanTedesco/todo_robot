class DeleteColumnsToTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :priority_task
    remove_column :tasks, :status_task
  end
end
