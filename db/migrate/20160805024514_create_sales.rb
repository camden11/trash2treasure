class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.string :name
      t.integer :organization_id
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
