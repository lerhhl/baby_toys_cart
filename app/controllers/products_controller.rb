class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.all
  end
  
  def show
    @product = Product.find(params[:id])
  end
  
end