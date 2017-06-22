class My::CartListsController < ApplicationController
  # include CurrentCart
  # before_action :set_cart, only: [:create, :update, :destroy]

  def new
  end

  def create
    @cart = find_cart
    @cartlist = CartList.new(product_id: params[:product_id], user_id: current_user.id)
    if @cartlist.save
      flash[:notice] = "Product successfully added to shopping cart"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def find_cart
    session[:cart] ||= Cart.new
  end

end
