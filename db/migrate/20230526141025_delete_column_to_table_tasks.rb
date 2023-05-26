class DeleteColumnToTableTasks < ActiveRecord::Migration[7.0]
  def change
    remove_column :tasks, :priority_id
  end
end
