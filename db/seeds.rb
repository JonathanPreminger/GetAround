
User.destroy_all
Car.destroy_all
Rent.destroy_all
User.create! :email => 'john@gmail.com', :password => 'topsecret'
User.create! :email => 'tiphaine@gmail.com', :password => 'encoresecret'

Car.create name: "Nissan Juke", price_per_day: 100, price_per_km: 5, user_id: 1, available_from: "2020-01-01", available_to: "2022-12-31"
Car.create name: "Renault Mégane", price_per_day: 70, price_per_km: 4, user_id: 1, available_from: "2020-01-01", available_to: "2024-12-31"
Car.create name: "Porshe Cayenne", price_per_day: 130, price_per_km: 7, user_id: 1, available_from: "2020-01-01", available_to: "2026-12-31"

Rent.create user_id: 2, car_id: 3, distance: 300, start_rent: "2022-08-18", end_rent: "2022-08-24"
Rent.create user_id: 2, car_id: 1, distance: 100, start_rent: "2021-03-01", end_rent: "2021-03-30"
