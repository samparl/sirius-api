class VendorsItems < ApplicationRecord
  belongs_to :vendor
  belongs_to :item
end
