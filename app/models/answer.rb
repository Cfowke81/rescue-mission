class Answer < ApplicationRecord
  validates :answer, presence: true
  validates :question_id, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :question
  has_many :votes, dependent: :destroy
end
