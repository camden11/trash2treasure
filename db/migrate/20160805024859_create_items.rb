class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.float :price
      t.integer :total_quantity
      t.integer :current_quantity
      t.timestamps
    end
  end
end
