class Task < ApplicationRecord
  scope :today, -> { where('start_date <= ? AND end_date >= ?', Date.today, Date.today) }
  scope :today_ended, -> { where(finished: false) }
  scope :ended, -> { where(finished: true) }
  scope :task, -> { where(typetask: :task) }
  scope :robot, -> { where(typetask: :robot) }
  scope :waiting, -> { where(status: :waiting) }
  scope :developing, -> { where(status: :developing) }
  scope :testing, -> { where(status: :testing) }
  scope :completed, -> { where(status: :completed) }
  scope :running, -> { where(status: :running) }
  validates :title, presence: true
  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :sub_tasks

  enum priority: { low: 'Low', moderate: 'Moderate', important: 'Important', urgent: 'Urgent' }
  enum status: { waiting: 'Waiting', developing: 'Developing', testing: 'Testing', completed: 'Completed', running: 'Running' }
  enum typetask: { robot: 'Robot', task: 'Task' }
end