class Car < ApplicationRecord
  belongs_to :user
  has_many :rents, inverse_of: :car, dependent: :destroy
  accepts_nested_attributes_for :rents

  validates :name, :price_per_km, :price_per_day, :available_from, :available_to, presence: true
  validates_associated :rents
end
