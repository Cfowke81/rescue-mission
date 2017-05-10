class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates :name, presence: true
  devise :registerable, :database_authenticatable
  devise :omniauthable, :omniauth_providers => [:github]

  has_many :questions
  has_many :answers
  has_many :votes, dependent: :destroy

  def self.find_or_create_with_omniauth(auth)
    found_user = User.find_by(uid: auth["uid"])
    return found_user if found_user
    create! do |user|
      user.provider = auth["provider"]
      user.email = auth["info"]["email"]
      user.uid = auth["uid"]
      user.name = auth["info"]["nickname"]
    end
  end
end
