class Project < ActiveRecord::Base
  include SluggableGem
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"

  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :category_projects
  has_many :categories, through: :category_projects
  has_many :jobs
  has_many :likes, as: :likeable

  validates :name, presence: true
  sluggable_column :name

end