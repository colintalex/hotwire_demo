# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Array of sample vehicle data
vehicles_data = [
  { make: 'Toyota', model: 'Camry', year: '2020', color: 'Red' },
  { make: 'Honda', model: 'Civic', year: '2019', color: 'Blue' },
  { make: 'Ford', model: 'F-150', year: '2021', color: 'Black' },
  { make: 'Chevrolet', model: 'Malibu', year: '2018', color: 'White' },
  { make: 'Nissan', model: 'Altima', year: '2022', color: 'Silver' }
]

# Loop to create 5 vehicles
vehicles_data.each do |vehicle|
  Vehicle.create(vehicle)
end
