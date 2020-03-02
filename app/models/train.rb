class Train < ApplicationRecord
    has_many :routes
    has_many :users, through: :routes
end
