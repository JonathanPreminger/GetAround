class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :car, inverse_of: :rents

  validates :distance, presence: true, numericality: { message: "{distance} must be a number" }
  validates :start_rent, :end_rent, presence: true

  before_create :price_decrease
end
