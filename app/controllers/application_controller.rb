class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :email, :provider, :uid ])
  end

  # def current_cart
  #   cart = Cart.find_by(session[:cart_id])
  #   if !cart && !current_user
  #     cart = Cart.create
  #     session[:cart_id] = cart.id
  #     cart = Cart.find_by(session[:cart_id])
  #   end
  #   if cart && current_user && cart.user_id.nil?
  #     cart.update(user_id: current_user.id)
  #     cart = Cart.find_by(user_id: current_user.id)
  #   end
  #   cart
  # end




  def current_cart
    cart = Cart.find_by(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    if !cart && !current_user
      cart = Cart.create
      session[:cart_id] = cart.id
      cart = Cart.find_by(session[:cart_id])
    end
    if cart && current_user
      cart.update(user_id: current_user.id)
      cart = Cart.find_by(user_id: current_user.id)
    end
    cart
  end

  # def current_cart
  #   @cart = Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #   if current_user
  #     cart = Cart.create
  #     cart.update_attributes(user_id: current_user.id)
  #   else
  #     Cart.find(session[:cart_id])
  #     rescue ActiveRecord::RecordNotFound
  #     cart = Cart.create
  #     session[:cart_id] = cart.id
  #   end
  # end

  # def set_cart
  #   if current_user
  #     @user_cart = ShoppingCart.find_by(user_id: current_user.id)
  #   end
  #   @session_cart = ShoppingCart.find_by(session_id: session[:session_id])
  #   #returning visitor
  #   if current_user && @session_cart
  #     byebug
  #     cart = ShoppingCart.find(@session_cart.id)
  #     cart.update_attributes(user_id: current_user.id)
  #     cart.update_attributes(session_id: "")
  #     @cart = cart
  #   elsif current_user && !@session_cart
  #     byebug
  #     @cart = ShoppingCart.create(user_id: current_user.id)
  #     @cart = cart
  #   elsif !current_user && !@session_cart
  #     @cart = ShoppingCart.create(session_id: session[:session_id])
  #   elsif !current_user && @session_cart
  #     byebug
  #     @cart = ShoppingCart.create(session_id: session[:session_id])
  #     cart = ShoppingCart.find(@session_cart.id)
  #     @cart = cart
  #   end


end
