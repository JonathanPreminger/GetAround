class Car < ApplicationRecord
  belongs_to :user
  has_many :rents, inverse_of: :car, dependent: :destroy
  accepts_nested_attributes_for :rents
  
  validates :price_per_km, presence: true, numericality: { message: "price km must be a number" }

  validates :name, :price_per_km, :price_per_day, presence: true
  validates_associated :rents
end
