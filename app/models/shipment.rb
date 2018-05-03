class Shipment < ApplicationRecord
  enum status: [ :pending, :shipped, :delivered, :failed ]
  belongs_to :order
  belongs_to :carrier
  belongs_to :vendor
  # alias_attribute :address, :origin
  alias_attribute :fulfillment_location, :location
  belongs_to :origin, class_name: 'Address', foreign_key: 'origin_id'
  has_and_belongs_to_many :items

  def self.get_shipments(options = {})
    shipments = Shipment.all
    shipments = shipments.where(vendor_id: options['vendor']) if options['vendor']
    shipments = shipments.where(customer_id: options['customer']) if options['customer']
    shipments = shipments.where(status: Shipment.statuses[options['status']]) if options['status']
    shipments
  end
end
