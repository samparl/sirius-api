class RemoveFaultyColumns < ActiveRecord::Migration[5.0]
  def change
    remove_column :shipments, :original_delivery
    remove_column :shipments, :estimated_delivery
  end
end
