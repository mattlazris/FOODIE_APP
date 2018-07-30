class User < ApplicationRecord
  has_many :meals, dependent: :destroy
  has_many :bookings

  validates :name, presence: true
  validates :name, presence: true, format: { with: /\A.*@.*\.com\z/ }
end
