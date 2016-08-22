class CreateShopperItems < ActiveRecord::Migration
  def change
    create_table :shopper_items do |t|
      t.integer :shopper_id
      t.integer :item_id
      t.timestamps null: false
    end
  end
end
