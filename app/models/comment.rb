class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :job

  #validates :body, presence: true
end