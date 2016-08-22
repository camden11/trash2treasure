class AddIndexToSalesOrganizationId < ActiveRecord::Migration
  def change
    add_index :sales, :organization_id
  end
end
