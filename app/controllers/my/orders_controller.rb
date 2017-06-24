class My::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find(params[:id])
    @ordered_products = @order.order_products
  end

  def new
    @cartlists = CartList.where(user_id: current_user.id)
    @order = Order.new
  end

  def create
    @cartlists = CartList.where(user_id: current_user.id)
    @order = Order.create(user_id: current_user.id)
    @order_value = @order.order_value
    @cartlists.each do |cartlist|
      OrderProduct.create(product_id: cartlist.product_id, order_id: @order.id, purchase_quantity: cartlist.purchase_quantity)
      CartList.delete(cartlist.id)
      @product = Product.find(cartlist.product_id)
      @new_stock_quantity = @product.stock_quantity - cartlist.purchase_quantity
      @product.update(stock_quantity:@new_stock_quantity)
      @order_value += Product.find(cartlist.product_id).price * cartlist.purchase_quantity
    end
    @order.update(order_value: @order_value)
    redirect_to root_path
  end

end
