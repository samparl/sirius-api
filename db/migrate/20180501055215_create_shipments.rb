class CreateShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :shipments do |t|
      t.string :status, null: false
      t.references :order, foreign_key: true
      t.references :vendor, foreign_key: true
      t.references :carrier, foreign_key: true
      t.references :origin, foreign_key: {to_table: :addresses}
      t.references :location, foreign_key: {to_table: :fulfillment_locations}
      t.string :status, null: false

      t.timestamps
    end
  end
end
