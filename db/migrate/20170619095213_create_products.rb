class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price, null: false
      t.string :country_of_origin, null: false
      t.string :brand, null: false
      t.string :age_group, null: false
      t.string :category, null: false
      t.text :description, null: false
      t.integer :stock_quantity, null: false, default: 0

      t.timestamps
    end
  end
end
