class User < ApplicationRecord
    has_many :train_routes
    has_many :trains, through: :train_routes
    has_secure_password
    validates :password, presence: true
    validates :name, presence: true
end
