class CreatePriorities < ActiveRecord::Migration[7.0]
  def change
    create_table :priorities do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
