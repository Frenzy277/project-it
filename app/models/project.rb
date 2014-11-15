class Project < ActiveRecord::Base
  include SluggableGem
  
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"

  has_many :user_projects
  has_many :users, through: :user_projects
  has_many :category_projects
  has_many :categories, through: :category_projects
  has_many :jobs
  has_many :likes, as: :likeable

  validates :project_name, presence: true
  sluggable_column :project_name

  def self.based_on_selected_tab(params)
    if params[:tab] == "in-progress"
      self.where(status: params[:tab])
    elsif params[:tab] == "finished"
      self.where(status: params[:tab])
    else
      self.where(status: "hiring")
    end
  end

  def total_likes
    self.likes.count
  end

end