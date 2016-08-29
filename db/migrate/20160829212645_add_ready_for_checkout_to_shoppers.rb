class AddReadyForCheckoutToShoppers < ActiveRecord::Migration
  def change
    add_column :shoppers, :ready_for_checkout, :boolean
  end
end
