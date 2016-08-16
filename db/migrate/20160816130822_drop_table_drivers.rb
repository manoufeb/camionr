class DropTableDrivers < ActiveRecord::Migration[5.0]
  def change
    remove_column :trucks, :driver_id
    drop_table :drivers
  end
end
