# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Carriers
['UPS', 'Fedex', 'Pony Express'].each {|name| Carrier.create!({name: name})}
carrier_ids = Carrier.pluck(:id)

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

10.times do
  Vendor.create!({
    name: Faker::Company.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(6)
  })
end
vendor_ids = Vendor.pluck(:id)

100.times do
  address = {
    line_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip
  }

  customer = Customer.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(6)
  })

  customer.addresses.create!(address)
end
customer_ids = Customer.pluck(:id)

1000.times do
  Item.create!({
    name: Faker::Commerce.product_name,
    sku: Faker::Lorem.characters(10),
    description: Faker::HitchhikersGuideToTheGalaxy.quote
  })
end
item_ids = Item.pluck(:id)

3000.times do
  customer = Customer.find(customer_ids.sample)
  order = Order.create!({
    customer: customer,
    address: customer.addresses.first
  })

  shipment = Shipment.create!({
    order: order,
    status: Shipment.statuses.keys.sample,
    origin: fulfillment_locations.sample.address,
    carrier: Carrier.find(carrier_ids.sample),
    vendor: Vendor.find(vendor_ids.sample)
  })

  items = 2.times.map { Item.find(item_ids.sample) }
  shipment.items << items
end
