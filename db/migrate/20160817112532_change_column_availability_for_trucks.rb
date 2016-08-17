class ChangeColumnAvailabilityForTrucks < ActiveRecord::Migration[5.0]
  def change
    change_column :trucks, :availability, :boolean, :default => true
  end
end
