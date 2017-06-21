class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def show
    @product = Product.find(params[:id])
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
  end

  def destroy

  end

  private

  def is_admin?
    redirect_to root_path unless current_user.is_admin
  end
  
  def product_params
    params.require(:product).permit(:name, :description, :age_group, :country_of_origin, :category, :brand, :price, :stock_quantity)
  end

end
