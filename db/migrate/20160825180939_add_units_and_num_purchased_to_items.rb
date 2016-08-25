class AddUnitsAndNumPurchasedToItems < ActiveRecord::Migration
  def change
    add_column :items, :units_per_sale, :integer
    add_column :items, :num_purchased, :integer
  end
end
