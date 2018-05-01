class CreateVendors < ActiveRecord::Migration[5.0]
  def change
    create_table :vendors do |t|
      t.string :name, null: false, index: true
      t.string :email, null: false, index: true
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
