class Message < ApplicationRecord
    belongs_to :user

    validates :message, presence: true
    validates :message, length: { minimum: 5 }
end
