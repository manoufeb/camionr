class Truck < ApplicationRecord
  belongs_to :user
  has_many :bookings
  CATEGORIES = %w(6-4 4-2)

end
