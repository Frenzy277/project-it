class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: "User", foreign_key: 'recipient_id'

  validates :recipient_id, :sender_id, :body, presence: true


  def mark_viewed!
    self.update(viewed_at: Time.now)
  end

  def sender
    User.find(self.sender_id)
  end
end