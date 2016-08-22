class AddSaleIdToShoppers < ActiveRecord::Migration
  def change
    add_column :shoppers, :sale_id, :integer
  end
end
