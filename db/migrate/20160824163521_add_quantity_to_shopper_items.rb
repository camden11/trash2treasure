class AddQuantityToShopperItems < ActiveRecord::Migration
  def change
    add_column :shopper_items, :quantity, :integer
  end
end
