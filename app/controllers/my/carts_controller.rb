class My::CartsController < ApplicationController

  def show
    @cart = current_cart
    @cartlist = CartList.where(cart_id: @cart)
  end

end
