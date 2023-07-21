class SubTask < ApplicationRecord
  validates :title, presence: true
  belongs_to :user
  belongs_to :task
end
