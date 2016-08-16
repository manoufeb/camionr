class Truck < ApplicationRecord
  belongs_to :user
  belongs_to :driver
  has_many :bookings
end
