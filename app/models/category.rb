class Category < ActiveRecord::Base
  include SluggableGem

  has_many :category_projects
  has_many :projects, through: :category_projects

  validates :name, presence: true

  sluggable_column :name
end