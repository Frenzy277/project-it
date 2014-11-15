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

  def total_jobs
    self.jobs.count
  end

  def total_projects
    self.projects.count
  end

  def unread_messages
    self.messages.where(viewed_at: nil)
  end

  def unread_messages?
    unread_messages.any?
  end

  def total_new_messages
    unread_messages.count
  end

  def mark_unread_messages!
    unread_messages.each do |msg|
      msg.mark_viewed!
    end
  end
end