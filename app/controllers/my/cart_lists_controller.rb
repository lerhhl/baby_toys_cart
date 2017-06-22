class My::CartListsController < ApplicationController
  # include CurrentCart
  # before_action :set_cart, only: [:create, :update, :destroy]

  def new
    @cartlist = CartList.new
  end

  def create
    @cartlist = CartList.new(user_id: current_user.id, product_id: params[:cart_list][:product_id], purchase_quantity: params[:cart_list][:purchase_quantity])
    if @cartlist.save!
      flash[:notice] = "Product successfully added to shopping cart"
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  # def find_cart
  #   session[:cart] ||= Cart.new
  # end

end
