class Task < ApplicationRecord
  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
  scope :today_ended, -> { where(finished: false) }
  scope :ended, -> { where(finished: true) }
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
end
