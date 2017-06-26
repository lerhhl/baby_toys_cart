class My::CartsController < ApplicationController

  def show
    @cart = current_cart
    @cartlists = CartList.where(cart_id: @cart)
  end

end
