class User < ActiveRecord::Base
  has_secure_password validations: false

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :likes, as: :likeable
  has_many :jobs
  has_many :comments

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }

end