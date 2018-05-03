class Vendor < ApplicationRecord
  has_secure_password
  has_many :orders
  has_and_belongs_to_many :items, through: :vendor_items
end
