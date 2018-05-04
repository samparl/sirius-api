class AddBackColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :shipments, :original_delivery, :datetime, index: true
    add_column :shipments, :estimated_delivery, :datetime, index: true
  end
end
