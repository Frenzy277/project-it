class Project < ActiveRecord::Base
  include SluggableGem
  
  belongs_to :manager, class_name: "User", foreign_key: "manager_id"

  has_many :user_projects, dependent: :destroy
  has_many :users, through: :user_projects
  has_many :category_projects, dependent: :destroy
  has_many :categories, through: :category_projects
  has_many :jobs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }
  validates :end_date, presence: true

  sluggable_column :title

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

  def team?
    self.team == true
  end

  def self.finished
    self.where(status: "finished")
  end

  def finished?
    self.status == "finished"
  end

  def hiring?
    self.status == "hiring"
  end

  def self.favorite_projects
    self.finished.order(likes_count: :desc).limit(5)
  end

end