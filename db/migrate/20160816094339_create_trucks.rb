class CreateTrucks < ActiveRecord::Migration[5.0]
  def change
    create_table :trucks do |t|
      t.string :type
      t.string :category
      t.string :description
      t.boolean :availability
      t.string :numberplate
      t.float :price
      t.references :user, foreign_key: true
      t.references :driver, foreign_key: true

      t.timestamps
    end
  end
end
