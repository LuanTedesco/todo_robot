class Task < ApplicationRecord
  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
  scope :today_ended, -> { where(finished: false) }
  scope :ended, -> { where(finished: true) }
  scope :task, -> { where(typetask: 'Tarefa') }
  scope :robot, -> { where(typetask: 'Robô') }
  scope :aguardando, -> { where(priority: 'Aguardando') }
  scope :desenvolvendo, -> { where(priority: 'Desenvolvendo') }
  scope :testando, -> { where(priority: 'Testando') }
  scope :concluido, -> { where(priority: 'Concluído') }
  scope :rodando, -> { where(priority: 'Rodando') }
  validates :title, presence: true

  enum priority: {
    'Baixa prioridade' => 'Baixa prioridade',
    'Moderado' => 'Moderado',
    'Importante' => 'Importante',
    'Urgente' => 'Urgente'
  }

  enum status: {
    'Aguardando' => 'Aguardando',
    'Desenvolvendo' => 'Desenvolvendo',
    'Testando' => 'Testando',
    'Concluído' => 'Concluído',
    'Rodando' => 'Rodando'
  }

  enum typetask: {
    'Robô' => 'Robô',
    'Tarefa' => 'Tarefa'
  }
end
