class CreateJoinTableCustomerAddress < ActiveRecord::Migration[5.0]
  def change
    create_join_table :customers, :addresses do |t|
      # t.index [:customer_id, :address_id]
      # t.index [:address_id, :customer_id]
    end
  end
end
