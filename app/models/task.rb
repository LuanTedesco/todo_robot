class Task < ApplicationRecord
  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
  scope :today_ended, -> { where(finished: false) }
  scope :ended, -> { where(finished: true) }
  validates :title, presence: true

  enum priority: { 'Baixa prioridade': 0, 'Moderado': 1, 'Importante': 2, 'Urgente': 3 }
  enum status: { 'Aguardando': 0, 'Desenvolvendo': 1, 'Testando': 2, 'Concluído': 3 }
end