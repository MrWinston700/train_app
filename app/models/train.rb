class Train < ApplicationRecord
    has_many :routes
    has_many :users, through: :routes

    accepts_nested_attributes_for :routes,  reject_if: :blank_name

  
  def blank_name(attributes)
    attributes['departing'].blank?
  end
end
