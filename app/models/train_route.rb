class TrainRoute < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :train
    validates :departing, presence: true
    validates :destination, presence: true


    def self.all_in_order
        all.order(destination: :desc)
    end

    
end
