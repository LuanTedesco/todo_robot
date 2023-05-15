class Priority < ApplicationRecord
  validates :name, :position, presence: true
  has_many :tasks
end
