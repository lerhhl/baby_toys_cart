class My::CartListsController < ApplicationController
  # include CurrentCart
  # before_action :set_cart, only: [:create, :update, :destroy]

  def new
    @cartlist = CartList.new
  end

  def create
    @product = Product.find(params[:cart_list][:product_id])
    if params[:cart_list][:purchase_quantity].to_i <= @product.stock_quantity
      @cartlist = CartList.new(user_id: current_user.id, product_id: params[:cart_list][:product_id], purchase_quantity: params[:cart_list][:purchase_quantity])
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
