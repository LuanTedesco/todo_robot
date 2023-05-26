class AddColumnsPriorityAndStatusToTasks < ActiveRecord::Migration[7.0]
  def change
    create_enum :priority, ['Baixa prioridade', 'Moderado', 'Importante', 'Urgente']
    add_column :tasks, :priority, :priority, default: 'Baixa prioridade', null: false

    create_enum :status, %w[Aguardando Desenvolvendo Testando Concluído Rodando]
    add_column :tasks, :status, :status, default: 'Aguardando', null: false
  end
end
