class Truck < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :gauge, :category, :price, presence: true
  validates :numberplate, presence: true, uniqueness: true
end
