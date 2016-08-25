class RemoveUnusedItemColumns < ActiveRecord::Migration
  def change
    remove_column :items, :code
    remove_column :items, :current_quantity
  end
end
