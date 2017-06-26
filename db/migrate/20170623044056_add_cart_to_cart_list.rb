class AddCartToCartList < ActiveRecord::Migration[5.1]
  def change
    add_reference :cart_lists, :cart, foreign_key: true
  end
end
