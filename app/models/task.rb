class Task < ApplicationRecord
  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
  scope :today_ended, -> { where(finished: false) }
  scope :ended, -> { where(finished: true) }

  validates :title, presence: true
end