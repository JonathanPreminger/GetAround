module Prices
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
    commission
  end

  # Comission Level 3
  def commission
    number_days_rent = (self.end_rent - self.start_rent).to_i
    commision = (self.price * 0.3)
    insurance_part = (commission * 0.5)
    roadside_assistance_part = number_days_rent
    rest_goes_to_us = commision - insurance_part - roadside_assistance_part
  end

  # Price LEVEL 1

  # def define_price
  #   number_days_rent = (self.end_rent - self.start_rent).to_i
  #   total_price_days = number_days_rent * self.car.price_per_day
  #   total_price_km = self.distance * self.car.price_per_km
  #   self.price = total_price_days + total_price_km
  # end

end
