class User < ActiveRecord::Base
  include SluggableGem
  has_secure_password validations: false

  has_many :user_projects
  has_many :projects, through: :user_projects
  has_many :likes, as: :likeable
  has_many :jobs
  has_many :comments
  has_many :messages, foreign_key: 'recipient_id'

  validates :username, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 3 }, on: :create

  sluggable_column :username

  def jobs_in_progress
    self.jobs.where(status: "in progress")
  end

  def total_jobs_in_progress
    jobs_in_progress.count
  end

  def jobs_completed
    self.jobs.where(status: "completed")
  end


  def total_projects
    self.projects.count
  end

  def unviewed_messages
    self.messages.where(viewed_at: nil)
  end

  def unviewed_messages?
    unviewed_messages.any?
  end

  def total_unviewed_messages
    unviewed_messages.count
  end

  def mark_unviewed_messages!
    unviewed_messages.each do |msg|
      msg.mark_viewed!
    end
  end

  def unread_messages
    self.messages.where(read: false)
  end

  def read_messages
    self.messages.where(read: true)
  end
end