class User < ActiveRecord::Base
  has_secure_password
  has_many :goals
  has_many :scheduled_goals

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  enum role: ["default", "admin"]
end
