class User < ApplicationRecord
    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

    validates :first_name, :last_name, :email, :password, presence: true
    validates :email, uniqueness: { case_sensitve: false }, format: { with: EMAIL_REGEX }
    validates :first_name, :last_name, length: { minimum: 2}
    validates :password, length: { minimum: 6 }
end
