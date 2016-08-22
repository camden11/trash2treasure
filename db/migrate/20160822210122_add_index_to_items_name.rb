class AddIndexToItemsName < ActiveRecord::Migration
  def change
    add_index :items, :name
    add_index :items, :sale_id
  end
end
