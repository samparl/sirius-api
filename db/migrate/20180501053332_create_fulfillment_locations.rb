class CreateFulfillmentLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :fulfillment_locations do |t|
      t.string :name
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
