class CreateCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :carts do |t|
      t.references :user, foreign_key: true, null: false
      t.references :cart_list, foreign_key: true, null: false
      t.timestamps
    end
  end
end
