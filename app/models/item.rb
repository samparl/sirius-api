class Item < ApplicationRecord
  belongs_to :vendor_items
  has_many :vendors, through: :vendor_items
  has_and_belongs_to_many :items
end
