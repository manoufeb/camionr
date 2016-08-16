class AddCollumnsToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :company, :string
    add_column :users, :siret, :string
    add_column :users, :address, :string
    add_column :users, :supplier, :boolean
  end
end
