class ChangeDeliveryColumnsToDateTime < ActiveRecord::Migration[5.0]
  def change
    change_column :shipments, :original_delivery, 'timestamp USING CAST(original_delivery AS timestamp)', index: true
    change_column :shipments, :estimated_delivery, 'timestamp USING CAST(estimated_delivery AS timestamp)', index: true
    change_column :shipments, :delivery, 'timestamp USING CAST(delivery AS timestamp)', index: true
  end
end
'integer USING CAST(status AS integer)'
