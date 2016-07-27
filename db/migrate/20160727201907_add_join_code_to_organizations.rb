class AddJoinCodeToOrganizations < ActiveRecord::Migration
  def change
    add_column :organizations, :join_code, :string
  end
end
