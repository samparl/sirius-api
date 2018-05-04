class AddThresholdDateColumnToShipments < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :threshold_date, :timestamp, index: true
  end
end
