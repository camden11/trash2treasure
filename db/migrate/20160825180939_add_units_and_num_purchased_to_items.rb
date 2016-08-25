class AddUnitsAndNumPurchasedToItems < ActiveRecord::Migration
  def change
    add_column :items, :units_per_sale, :integer, default: 1
    add_column :items, :num_purchased, :integer, default: 0
  end
end
