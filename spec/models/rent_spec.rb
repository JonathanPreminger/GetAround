require 'rails_helper'

RSpec.describe Rent, type: :model do
  describe 'creation' do
    it 'can be created with right params' do
      User.create id: 1, email: "john@gmail.com", password:"aaaaaaa"
      Car.create id: 1, name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: 1, available_from: "2020-01-01", available_to: "2022-12-31"
      rent = Rent.create id: 1, user_id: 1, car_id: 1, distance:50, start_rent: "2021-05-01", end_rent: "2021-05-30"
      expect(rent).to be_valid
    end

    it 'can t be created with a distance different than integer' do
      User.create id: 1, email: "john@gmail.com", password:"aaaaaaa"
      Car.create id: 1, name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: 1, available_from: "2020-01-01", available_to: "2022-12-31"
      rent = Rent.create id: 1, user_id: 1, car_id: 1, distance:"aaa", start_rent: "2021-05-01", end_rent: "2021-05-30"
      expect(rent).not_to be_valid
    end

    it 'calcul the price of the rent before create' do
      user = User.create id: 1, email: "john@gmail.com", password:"aaaaaaa"
      car = Car.create id: 1, name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: user.id, available_from: "2020-01-01", available_to: "2022-12-31"
      rent = Rent.create id: 1, user_id: user.id, car_id: car.id, distance:50, start_rent: "2021-05-01", end_rent: "2021-05-30"
      Rails.logger.debug(rent)
      expect(rent.price).to eq(2010)
    end

    it 'calcul the insurance of the rent before create' do
      user = User.create id: 1, email: "john@gmail.com", password:"aaaaaaa"
      car = Car.create id: 1, name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: user.id, available_from: "2020-01-01", available_to: "2022-12-31"
      rent = Rent.create id: 1, user_id: user.id, car_id: car.id, distance:50, start_rent: "2021-05-01", end_rent: "2021-05-30"
      Rails.logger.debug(rent)
      expect(rent.insurance).to eq(301.5)
    end

    it 'calcul the roadside_assistance of the rent before create' do
      user = User.create id: 1, email: "john@gmail.com", password:"aaaaaaa"
      car = Car.create id: 1, name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: user.id, available_from: "2020-01-01", available_to: "2022-12-31"
      rent = Rent.create id: 1, user_id: user.id, car_id: car.id, distance:50, start_rent: "2021-05-01", end_rent: "2021-05-30"
      Rails.logger.debug(rent)
      expect(rent.roadside_assistance).to eq(29)
    end

    it 'calcul the rest_goes_to_us of the rent before create' do
      user = User.create id: 1, email: "john@gmail.com", password:"aaaaaaa"
      car = Car.create id: 1, name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: user.id, available_from: "2020-01-01", available_to: "2022-12-31"
      rent = Rent.create id: 1, user_id: user.id, car_id: car.id, distance:50, start_rent: "2021-05-01", end_rent: "2021-05-30"
      Rails.logger.debug(rent)
      expect(rent.rest_goes_to_us).to eq(272.5)
    end

  end
end
