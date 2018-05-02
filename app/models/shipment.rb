class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :carrier
  has_and_belongs_to_many :items
end
