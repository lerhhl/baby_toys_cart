class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_order, only: [:show, :edit, :update]

  def index
    @orders = Order.all
  end
  
  def show
    @ordered_products = @order.order_products
  end

  def edit
    @ordered_products = @order.order_products
  end

  def update
    @order.update(order_params)
    redirect_to admin_order_path(@order)
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