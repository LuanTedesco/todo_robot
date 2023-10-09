class AddEnumPriorityToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :priority, :string, default: 'low', null: false
  end
end
