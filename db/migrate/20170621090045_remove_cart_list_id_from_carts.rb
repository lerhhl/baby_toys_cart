class RemoveCartListIdFromCarts < ActiveRecord::Migration[5.1]
  def change
    remove_column :carts, :cart_list_id
  end
end
