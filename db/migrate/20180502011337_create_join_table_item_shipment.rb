class CreateJoinTableItemShipment < ActiveRecord::Migration[5.0]
  def change
    create_join_table :items, :shipments do |t|
      # t.index [:item_id, :shipment_id]
      # t.index [:shipment_id, :item_id]
    end
  end
end
