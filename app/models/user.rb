class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :meals, dependent: :destroy
  has_many :bookings

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, format: { with: /\A.*@.*\.[a-zA-Z]+\z/ }, uniqueness: { case_sensitive: false }
end
