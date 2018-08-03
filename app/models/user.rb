class User < ApplicationRecord
  acts_as_favoritor
  acts_as_favoritable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  mount_uploader :photo, PhotoUploader

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  has_many :meals, dependent: :destroy
  has_many :bookings

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
