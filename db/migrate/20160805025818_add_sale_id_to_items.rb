class AddSaleIdToItems < ActiveRecord::Migration
  def change
    add_column :items, :sale_id, :integer
  end
end
