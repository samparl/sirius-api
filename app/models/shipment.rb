class Shipment < ApplicationRecord
  attr_accessor :estimated_delivery, :original_delivery
  enum status: [ :pending, :shipped, :delivered, :failed ]
  belongs_to :order
  belongs_to :carrier
  belongs_to :vendor
  belongs_to :location, class_name: 'FulfillmentLocation', foreign_key: 'location_id'
  belongs_to :origin, class_name: 'Address', foreign_key: 'origin_id'
  has_and_belongs_to_many :items

  scope :status, -> (status) { where status: self.statuses[status] }
  scope :vendor, -> (vendor) { where vendor_id: vendor }
  scope :customer, -> (customer) { joins(:order).where(orders: { customer_id: customer }) }
  scope :late, -> { where('shipments.scheduled_delivery < shipments.projected_delivery') }

  # N.B. The threshold_date criterion determining very_late is set upon shipment creation
  scope :very_late, -> { where('shipments.threshold_date < shipments.projected_delivery') }

  def self.summary
    total = Shipment.all.count
    late = Shipment.all.late.count
    very_late = Shipment.all.very_late.count
    { on_time: total - late, late: late - very_late, very_late: very_late }
  end
end
