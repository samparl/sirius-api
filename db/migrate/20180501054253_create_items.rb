class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string :name, null: false, index: true
      t.string :sku, null: false, index: true
      t.text :description

      t.timestamps
    end
  end
end
