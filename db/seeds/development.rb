# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

load(Rails.root.join('db', 'seeds', 'helpers.rb'))

# Run hard coded seed values
# Carriers
['UPS', 'Fedex', 'Pony Express'].each {|name| Carrier.create!({name: name})}
# carrier_ids = Carrier.pluck(:id)

# Fulfillment Locations
fulfillment_locations = [
  {
    name: 'UPS Freight - Mira Loma, CA',
    address: Address.create!({
      line_1: '12455 Harvest Dr.',
      city: 'Mira Loma',
      state: 'CA',
      zip: '91752'
    })
  },
  {
    name: 'UPS Freight - San Leandro, CA',
    address: Address.create!({
      line_1: '3050 Teagarden St.',
      city: 'San Leandro',
      state: 'CA',
      zip: '94577'
    })
  },
  {
    name: 'UPS Freight - Colorado Springs, CO',
    address: Address.create!({
      line_1: '2420 Wayside Ct. # A,',
      city: 'Colorado Springs',
      state: 'CO',
      zip: '80915'
    })
  },
  {
    name: 'UPS Freight - Chicago, IL',
    address: Address.create!({
      line_1: '6633 W 75th St.',
      city: 'Chicago',
      state: 'IL',
      zip: '60638'
    })
  },
  {
    name: 'UPS Freight - Brooklyn, NY',
    address: Address.create!({
      line_1: '295 Lombardy St',
      city: 'Brooklyn',
      state: 'NY',
      zip: '11222'
    })
  },
  {
    name: 'UPS Freight - Southborough, MA',
    address: Address.create!({
      line_1: '185 Boston Rd',
      city: 'Southborough',
      state: 'MA',
      zip: '01772'
    })
  }
].map {|location| FulfillmentLocation.create!(location)}

random_vendors(10)
random_addresses(100)
random_customers(100)
random_items(1000)
random_shipments(3000, 2)
