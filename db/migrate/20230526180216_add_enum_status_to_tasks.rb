class AddEnumStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :status, :string, default: 'waiting', null: false
  end
end
