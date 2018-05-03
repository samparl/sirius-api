class ChangeDeliveryTimestampsToStrings < ActiveRecord::Migration[5.0]
  def change
    change_column :shipments, :original_delivery, :string, index: true
    change_column :shipments, :estimated_delivery, :string, index: true
    change_column :shipments, :delivery, :string, index: true
  end
end
