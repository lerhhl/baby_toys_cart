class My::CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_cart
    @cartlist = CartList.where(cart_id: @cart)
  end

end