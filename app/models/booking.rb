class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :user, presence: true
  validates :meal, presence: true
  validates :time, presence: true
  validates :price, presence: true
end
