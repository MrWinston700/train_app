class User < ApplicationRecord
    has_many :routes
    has_many :trains, through: :routes
    has_secure_password
    validates :password, presence: true
end
