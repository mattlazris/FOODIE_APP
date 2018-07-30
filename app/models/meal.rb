class Meal < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :user, presence: true
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :category, presence: true, inclusion: {
    in: ['Chinese Food', 'Asian Food', 'Western Food', 'Alcohol-related', 'Dessert and Coffee'],
    message: "%{value} is not a valid category" }
end
