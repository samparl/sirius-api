class Shipment < ApplicationRecord
  attr_accessor :estimated_delivery, :original_delivery
  enum status: [ :pending, :shipped, :delivered, :failed ]
  belongs_to :order
  belongs_to :carrier
  belongs_to :vendor
  alias_attribute :fulfillment_location, :location
  belongs_to :origin, class_name: 'Address', foreign_key: 'origin_id'
  has_and_belongs_to_many :items

  scope :status, -> (status) { where status: self.statuses[status] }
  scope :vendor, -> (vendor) { where vendor_id: vendor }
  scope :customer, -> (customer) { joins(:order).where(orders: { customer_id: customer }) }
  # scope :late, -> { where() }
  # 
  # def late
  #   :original_delivery < :estimated_delivery
  # end
end
