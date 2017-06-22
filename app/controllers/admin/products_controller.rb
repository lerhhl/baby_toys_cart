class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product[:country_of_origin] = @product.country_name
    if @product.save
      redirect_to admin_product_path(@product)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @product.update(product_params_update)
      redirect_to admin_product_path(@product)
    else
      render :edit
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
    params.require(:product)["country_of_origin"] = ISO3166::Country[params.require(:product)["country_of_origin"]].translations[I18n.locale.to_s] || country.name
    params.require(:product).permit(:name, :description, :age_group, :country_of_origin, :category, :brand, :price, :stock_quantity)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
