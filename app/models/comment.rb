class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :message

  validates :message, presence: true
  validates :message, length: { minimum: 3 }
end
