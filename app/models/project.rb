class Project < ActiveRecord::Base
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"

  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :category_projects
  has_many :categories, through: :category_projects
  has_many :jobs
  has_many :likes, as: :likeable

  validates :name, presence: true


end