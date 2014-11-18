class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  validates :name, :description, :deadline, :status, :user_id, :project_id, presence: true
end