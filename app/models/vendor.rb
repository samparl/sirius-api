class Vendor < ApplicationRecord
  has_many :orders
  has_many :vendor_items
  has_and_belongs_to_many :items, through: :vendor_items
end
