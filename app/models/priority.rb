class Priority < ApplicationRecord

  validates :name, :position, presence: true
end
