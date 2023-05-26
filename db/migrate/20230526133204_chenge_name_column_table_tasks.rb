class ChengeNameColumnTableTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :status, :status_task
  end
end
