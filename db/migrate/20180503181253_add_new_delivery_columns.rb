class AddNewDeliveryColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :scheduled_delivery, :timestamp, index: true
    add_column :shipments, :projected_delivery, :timestamp, index: true
  end
end
