class ChangeDateFormatInBookings < ActiveRecord::Migration[5.0]
  def change
    change_column :bookings, :starting_date, "date USING starting_date::date"
    change_column :bookings, :ending_date, "date USING ending_date::date"
  end
end
