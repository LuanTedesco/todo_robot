class AddEnumTypetaskToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :typetask, :string, default: 'task', null: false
  end
end