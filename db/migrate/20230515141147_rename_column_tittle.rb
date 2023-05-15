class RenameColumnTittle < ActiveRecord::Migration[7.0]
  def change
    rename_column :tasks, :tittle, :title
  end
end
