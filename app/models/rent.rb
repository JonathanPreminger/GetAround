class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :car, inverse_of: :rents

  validates :distance, presence: true, numericality: { message: "{distance} must be a number" }
  validates :start_rent, presence: true
  validates :end_rent, presence: true

  before_create :define_price

  def define_price
    number_days_rent = (self.end_rent - self.start_rent).to_i
    total_price_days = number_days_rent * self.car.price_per_day
    total_price_km = self.distance * self.car.price_per_km
    self.price = total_price_days + total_price_km
  end

end
