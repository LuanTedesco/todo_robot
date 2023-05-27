class AddColumnTypetaskToTasks < ActiveRecord::Migration[7.0]
  def change
    create_enum :typetask, ['Robô', 'Tarefa']
    add_column :tasks, :typetask, :typetask, default: 'Tarefa', null: false
  end
end