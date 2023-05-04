class Task < ApplicationRecord

  scope :today, -> { where(end_date: Date.today) }
end
