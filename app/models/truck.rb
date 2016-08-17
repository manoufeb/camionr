class Truck < ApplicationRecord
  belongs_to :user
  has_many :bookings
  CATEGORIES = %w(8x4 6x4 4x2 Semi)
  GAUGE = %w(Toupie Grue Benne Bi-Benne)

  validates :gauge, :category, :price, presence: true

  validates :numberplate, presence: true, uniqueness: true
end
