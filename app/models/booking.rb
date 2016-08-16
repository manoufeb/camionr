class Booking < ApplicationRecord
  belongs_to :truck
  belongs_to :user
  validates :location, :starting_date, :ending_date, presence: true
end
