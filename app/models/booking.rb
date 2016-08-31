class Booking < ApplicationRecord
  belongs_to :truck
  belongs_to :user
  validates :location, :starting_date, :ending_date, presence: true

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
