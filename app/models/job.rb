class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  has_many :comments

  validates :job_name, presence: true
end