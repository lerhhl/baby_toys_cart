class Admin::ProductsController < ApplicationController
  require 'time'

  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_product, only: %i[show edit update destroy]

  def show
    @orders = @product.orders
    @order_product_list = OrderProduct.where(product_id: params[:id])
    @product_sales = {}
    @order_product_list.each_with_index do |order, index|
      @date = order[:created_at].to_date.strftime('%e %b %Y')
      @purchase_quantity = order[:purchase_quantity]
      if @product_sales.has_key?(@date)
        @product_sales[@date] = @purchase_quantity + @product_sales[@date]
      else
        @product_sales[@date] = @purchase_quantity
      end
    end
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    product_images_build
    if @product.save && @product_image.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def edit; end

  def update
    if product_image_params.empty?
      if @product.update(product_params_update)
        product_images_delete
        redirect_to product_path(@product)
      else
        render :edit
      end
    else
      product_images_build
      if @product.update(product_params_update) && @product_image.save
        product_images_delete
        redirect_to product_path(@product)
      else
        render :edit
      end
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  private

  def is_admin?
    redirect_to root_path unless current_user.is_admin
  end

  def product_params
    params.require(:product).permit(:name, :description, :age_group, :country_of_origin, :category, :brand, :price, :stock_quantity)
  end

  def product_params_update
    params.require(:product).permit(:name, :description, :age_group, :country_of_origin, :category, :brand, :price, :stock_quantity)
  end

  def product_images_build
    @product_image = @product.product_images.build(product_image_params)
  end

  def product_image_params
    params.require(:product).permit(:image_url, :product_id)
  end

  def product_images_delete
    if params[:selected_image_id] != nil
      delete_image_arr = params[:selected_image_id]
      delete_image_arr != nil
        delete_image_arr.each do |image_id|
          @product_image = ProductImage.find(image_id)
          @product_image.destroy
        end
    end
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
