class AddColumnStatusToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :status, :string
  end
end
