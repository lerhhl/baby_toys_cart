class RemoveForeignKeyFromCart < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :carts, column: :user_id
  end
end
