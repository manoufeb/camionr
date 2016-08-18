# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Truck.destroy_all
Booking.destroy_all

customer = User.create(email: "customer@test.com", password: "123456")
supplier = User.create(email: "supplier@test.com", password: "123456")

truck = Truck.create(user: supplier, gauge: "8x4", category: "Grue", numberplate: "867 RJB 34", price: 870, description: "Très beau camion", availability: true)

booking = Booking.create(location: "Paris", starting_date: Date.new(2016, 8, 18), ending_date: Date.new(2016, 8, 20), truck: truck, user: customer)
