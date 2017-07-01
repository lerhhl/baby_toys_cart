class Admin::OrdersController < ApplicationController

  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_order, only: %i[show edit update]

  def index
    @orders = Order.all
    @product_sales = OrderProduct.group(:product_id).count
  end

  def show
    @ordered_products = @order.order_products
    # @order_product_list = OrderProduct.where(product_id: params[:id])
    # @product_sales = {}
    # @order_product_list.each_with_index do |order, index|
    #   @date = order[:created_at]
    #   @purchase_quantity = order[:purchase_quantity]
    #   if @product_sales.has_key?(@date)
    #     @product_sales[@date] = @purchase_quantity + @product_sales[@date]
    #   else
    #     @product_sales[@date] = @purchase_quantity
    #   end
    # end
  end

  def edit
    @ordered_products = @order.order_products
  end

  def update
    @order.update(order_params)
    OrderMailer.order_status_update(@order).deliver_now
    redirect_to admin_order_path(@order)
  end

  def user_orders
    @orders = Order.all
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.is_admin
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status)
  end

end
