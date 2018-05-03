class Item < ApplicationRecord
  has_and_belongs_to_many :shipments
  has_many :vendors, through: :vendors_items
end
