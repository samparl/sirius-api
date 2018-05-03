class ChangeShipmentStatusToInteger < ActiveRecord::Migration[5.0]
  def change
    change_column :shipments, :status, 'integer USING CAST(status AS integer)', default: 0
  end
end
