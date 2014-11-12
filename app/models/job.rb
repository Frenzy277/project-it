class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_many :comments

  validates :name, presence: true
end