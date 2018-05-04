def random_vendors(repeated)
  repeated.times do
    Vendor.create!({
      name: Faker::Company.name,
      email: Faker::Internet.email,
      password: Faker::Lorem.characters(6)
    })
  end
end

def random_addresses(repeated)
  Address.create!({
    line_1: Faker::Address.street_address,
    city: Faker::Address.city,
    state: Faker::Address.state,
    zip: Faker::Address.zip
  })
end

def random_customers(repeated)
  Customer.create!({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(6)
  })
end

def random_items(repeated)
  repeated.times do
    Item.create!({
      name: Faker::Commerce.product_name,
      sku: Faker::Lorem.characters(10),
      description: Faker::HitchhikersGuideToTheGalaxy.quote
    })
  end
end

def random_shipments(repeated, item_count)
  carriers = Carrier.pluck(:id)
  customers = Customer.pluck(:id)
  items = Item.pluck(:id)
  vendors = Vendor.pluck(:id)
  fulfillment_locations = FulfillmentLocation.pluck(:id)

  repeated.times do
    customer = Customer.find(customers.sample)
    carrier = Carrier.find(carriers.sample)
    vendor = Vendor.find(vendors.sample)
    item = Item.find(items.sample)
    origin = FulfillmentLocation.find(fulfillment_locations.sample)
    location = FulfillmentLocation.find(fulfillment_locations.sample)

    order = Order.create!({
      customer: customer,
      address: customer.addresses.first
    })

    shipment = Shipment.create!({
      order: order,
      status: Shipment.statuses.keys.sample,
      origin: origin.address,
      location: location,
      carrier: Carrier.find(carrier),
      vendor: Vendor.find(vendor)
    })

    items = item_count.times.map { Item.find(item) }
    shipment.items << items

    scheduled_delivery = (Time.now - rand(30 * 6 * 86400))
    projected_delivery = (scheduled_delivery - rand(2 * 86400) + 4 * 86400)

    shipment.scheduled_delivery = scheduled_delivery.utc.to_s
    shipment.projected_delivery = projected_delivery.utc.to_s

    if shipment.delivered?
      shipment.delivery = shipment.projected_delivery.utc.to_s
    end

    shipment.save!
  end
end
