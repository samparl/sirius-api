class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :middle_name
      t.string :password_digest, null: false
      t.string :email, null: false, unique: true
      t.string :phone

      t.timestamps
    end
  end
end
