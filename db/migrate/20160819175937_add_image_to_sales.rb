class AddImageToSales < ActiveRecord::Migration
  def change
    add_attachment :sales, :image
  end
end
