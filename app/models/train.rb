class Train < ApplicationRecord
    has_many :train_routes
    has_many :users, through: :train_routes
    validates :ident_number, presence: true
    validates :model, presence: true
    

    accepts_nested_attributes_for :train_routes,  reject_if: :blank_name

  
  def blank_name(attributes)
    attributes['departing'].blank?
  end
end
