class Task < ApplicationRecord
  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
  scope :today_ended, -> { where(finished: false) }
  scope :ended, -> { where(finished: true) }
  scope :task, -> { where(typetask: 'Tarefa') }
  scope :robot, -> { where(typetask: 'Robô') }
  scope :aguardando, -> { where(status: 'Aguardando') }
  scope :desenvolvendo, -> { where(status: 'Desenvolvendo') }
  scope :testando, -> { where(status: 'Testando') }
  scope :concluido, -> { where(status: 'Concluído') }
  scope :rodando, -> { where(status: 'Rodando') }
  validates :title, presence: true
  belongs_to :user
  has_and_belongs_to_many :tags

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
