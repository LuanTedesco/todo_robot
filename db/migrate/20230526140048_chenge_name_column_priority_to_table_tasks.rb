class ChengeNameColumnPriorityToTableTasks < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :priority, :priority_task
  end
end
