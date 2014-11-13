class Message < ActiveRecord::Base
  belongs_to :recipient, class_name: "User", foreign_key: 'recipient_id'

  validates :recipient_id, :sender_id, :body, presence: true

end