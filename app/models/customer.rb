class Customer < ApplicationRecord
  has_secure_password
  has_many :orders
  has_and_belongs_to_many :addresses
end
