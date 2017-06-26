class My::CartListsController < ApplicationController

  def new
    @cartlist = CartList.new
  end

  def create
    @product = Product.find(params[:cart_list][:product_id])
    @cart = current_cart
    if params[:cart_list][:purchase_quantity].to_i <= @product.stock_quantity
      @cartlist = CartList.new(cart_id: current_cart.id, product_id: params[:cart_list][:product_id], purchase_quantity: params[:cart_list][:purchase_quantity])
      if @cartlist.save!
        flash[:notice] = "Product successfully added to shopping cart"
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:notice] = "Stock is not enough"
      redirect_to product_path(@product)
    end
  end

  def destroy
    @cartlist = CartList.find(params[:id])
    @cartlist.destroy
    redirect_back(fallback_location: root_path)
  end

  # def find_cart
  #   session[:cart] ||= Cart.new
  # end

end
