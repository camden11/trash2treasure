class AddDisplayNameToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :display_name, :string
  end
end
