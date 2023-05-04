class Task < ApplicationRecord

  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
end