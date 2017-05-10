class Question < ApplicationRecord
  validates :title, length: { minimum: 40 }
  validates :description, length: { minimum: 150 }
  validates :user_id, presence: true

  belongs_to :user
  has_many :answers
end
