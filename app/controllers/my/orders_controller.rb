class My::OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @orders = Order.where(user_id: current_user.id)
  end

  def show
    @order = Order.find_by(id: params[:id], user_id: current_user.id)
    if @order == nil
      flash[:notice] = "Unauthorised user"
      redirect_to root_path
    else
      @ordered_products = @order.order_products
    end
  end

  def new
    @user = current_user
    @cartlists = CartList.where(cart_id: current_cart)
    if @cartlists.empty?
      flash[:notice] = "No product in your shopping cart"
      redirect_to my_cart_path
    else
      @order = Order.new
    end
  end

  def create
    @cartlists = CartList.where(cart_id: current_cart.id)
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
    OrderMailer.order_confirmation(@order).deliver_now
    redirect_to new_payments_path(order_id: @order.id)
  end

end
