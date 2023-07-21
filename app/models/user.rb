class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :tasks
  has_many :tags
  has_many :sub_tasks
end
