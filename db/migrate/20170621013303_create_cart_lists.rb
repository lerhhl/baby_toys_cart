class CreateCartLists < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_lists do |t|
      t.integer :purchase_quantity, default: 0, null: false
      t.references :user, foreign_key: true, null:false
      t.references :product, foreign_key: true, null:false
      t.timestamps
    end
  end
end
