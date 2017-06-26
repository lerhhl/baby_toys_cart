class ProductsController < ApplicationController
  #before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end

  def show
    # @cart = Cart.find_cart
    @cartlist = CartList.new
    @product = Product.find(params[:id])
  end

  # def add_to_cart
  #   @cart = find_cart
  #   @product = Product.find(params[:product_id])
  #   byebug
  #   @cart.add_product(@product)
  # end
  #
  # def find_cart
  #   unless session[:cart]
  #     session[:cart] = Cart.new
  #   end
  #   session[:cart]
  # end

end
