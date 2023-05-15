class RemoveColumnFromTablePriority < ActiveRecord::Migration[7.0]
  def change
    remove_column :priorities, :position, :integer
  end
end
