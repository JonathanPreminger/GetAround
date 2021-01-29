class Rent < ApplicationRecord
  belongs_to :user
  belongs_to :car, inverse_of: :rents

  validates :distance, presence: true, numericality: { message: "{distance} must be a number" }
  validates :start_rent, :end_rent, presence: true

  before_create :price_decrease, :insurance, :roadside_assistance, :rest_goes_to_us

  # Price LEVEL 2

  def price_decrease
    number_days_rent = (self.end_rent - self.start_rent).to_i
    total_price_km = self.distance * self.car.price_per_km
    number_days_rent += 1
    total_price_days = 0
    number_days_rent.times do |day|
      if day == 1
        total_price_days += self.car.price_per_day
      elsif day > 1 && day <= 5
        total_price_days += (self.car.price_per_day * 0.9)
      elsif day > 5 && day <= 10
        total_price_days += (self.car.price_per_day * 0.7)
      elsif day > 10
        total_price_days += (self.car.price_per_day * 0.5)
      end
    end
    self.price = total_price_days + total_price_km
  end

  # Comission Level 3
  def insurance
    commission = (self.price * 0.3)
    self.insurance  = commission * 0.5
  end

  def roadside_assistance
    number_days_rent = (self.end_rent - self.start_rent).to_i
    self.roadside_assistance = number_days_rent
  end

  def rest_goes_to_us
    commision = (self.price * 0.3)
    self.rest_goes_to_us = (self.price * 0.3) - self.insurance - self.roadside_assistance
  end

  # Price LEVEL 1

  # def define_price
  #   number_days_rent = (self.end_rent - self.start_rent).to_i
  #   total_price_days = number_days_rent * self.car.price_per_day
  #   total_price_km = self.distance * self.car.price_per_km
  #   self.price = total_price_days + total_price_km
  # end

end
