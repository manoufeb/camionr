class ChangeTypeCollumnInTruck < ActiveRecord::Migration[5.0]
  def change
    rename_column :trucks, :type, :gauge
  end
end
