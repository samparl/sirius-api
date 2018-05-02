class CreateJoinTableVendorItem < ActiveRecord::Migration[5.0]
  def change
    create_join_table :vendors, :items do |t|
      # t.index [:vendor_id, :item_id]
      # t.index [:item_id, :vendor_id]
    end
  end
end
