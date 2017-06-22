class My::CartListsController < ApplicationController

  def new
    @cartlist = CartList.new
  end

  def create
    @cart = current_cart
    @cartlist = CartList.new(cart_id: @cart.id, product_id: params[:cart_list][:product_id], purchase_quantity: params[:cart_list][:purchase_quantity])
    if @cartlist.save!
      flash[:notice] = "Product successfully added to shopping cart"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end


end
