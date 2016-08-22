class AddIndexToShopperItemIds < ActiveRecord::Migration
  def change
    add_index :shopper_items, :shopper_id
    add_index :shopper_items, :item_id
  end
end
