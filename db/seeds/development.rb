# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Fulfillment Locations
fulfillment_locations = [
  [{ name: 'UPS Freight - Mira Loma' }],
  [{ name: 'UPS Freight - Mira Loma' }],
  [{ name: 'UPS Freight - Mira Loma' }],
  [{ name: 'UPS Freight - Mira Loma' }]
]

# Addresses
streets = [
  'Robin Hood Way',
  'Robin Hood Road',
  'Robin Hood Lane',
  'Sherwood Way',
  'Sherwood Road',
  'Sherwood Lane',
  'Friar Tuck Way',
  'Friar Tuck Road',
  'Friar Tuck Lane',
  'Hastings Way',
  'Hastings Road',
  'Hastings Lane'
]

street_addresses = streets.each do |street|
  [*1..50].map { |number| "#{number} #{street}"}
end

cities = [
  {
    city: 'Boston',
    state: 'MA'
    zip: 02111
  },
  {
    city: 'Los Angeles',
    state: 'CA'
    zip: 90210
  },
  {
    city: 'San Francisco',
    state: 'CA',
    zip: 94110
  },
  {
    city: 'Denver',
    state: 'CO',
    zip: 80217
  },
  {
    city: 'New York',
    state: 'NY'
    zip: 10011
  }
]

addresses = cities.reduce([]), { |addresses, city|
  street_addresses.map { |street_address|
    addresses.push(Address.save!({ line_1: street_address, **city }))
  }
}
p addresses

# Customer Names
# first_names = [
#   'George',
#   'Rasmus',
#   'Carlotta',
#   'Ingrid',
#   'Sam'
# ]
#
# last_names = [
#   'Pedersen',
#   'Lacroix',
#   'Stein',
#   'Nicholson'
# ]
#
# last_names.reduce([]) { |customers, last_name|
#   first_names.map { |first_name|
#     customers.push(Customer.save!({
#       first_name: first_name,
#       last_name: last_name,
#       email: "#{first_name}_#{last_name}@dispostable.com",
#       password: last_name+first_name,
#       address: addresses.sample
#     }))
#   }
# }
