class AddCheckedOutToShoppers < ActiveRecord::Migration
  def change
    add_column :shoppers, :checked_out, :boolean
  end
end
