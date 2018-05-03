class ChangeItemsVendorsToVendorsItems < ActiveRecord::Migration[5.0]
  def change
    rename_table :items_vendors, :vendors_items
  end
end
