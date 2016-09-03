class CreateExtraCharges < ActiveRecord::Migration
  def change
    create_table :extra_charges do |t|
      t.float :price
      t.string :name
      t.integer :shopper_id
    end
  end
end
