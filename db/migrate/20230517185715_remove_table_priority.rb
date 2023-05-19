class RemoveTablePriority < ActiveRecord::Migration[7.0]
  def change

    remove_foreign_key :tasks, :priorities
    drop_table :priorities
  end
end