class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.string :starting_date
      t.string :ending_date
      t.string :location
      t.string :description
      t.references :truck, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
