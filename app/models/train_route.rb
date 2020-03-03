class TrainRoute < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :train
end
