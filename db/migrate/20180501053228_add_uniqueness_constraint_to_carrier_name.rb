class AddUniquenessConstraintToCarrierName < ActiveRecord::Migration[5.0]
  def change
    add_index :carriers, :name, unique: true
  end
end
