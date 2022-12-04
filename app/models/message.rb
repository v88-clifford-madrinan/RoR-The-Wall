class Message < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy

    validates :message, presence: true
    validates :message, length: { minimum: 5 }
end
