class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :current_cart

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :email, :provider, :uid ])
  end

  def current_cart
    if current_user && Cart.find_by(user_id: current_user.id) == nil
      user_cart = Cart.create(user_id: current_user.id)
    elsif current_user
      if !session[:cart_id] && Cart.find_by(user_id: current_user.id) == nil
        user_cart = Cart.create(user_id: current_user.id)
      else
        user_cart = Cart.find_by(user_id: current_user.id)
        @cartlists = CartList.where(cart_id: session[:cart_id])
        @cartlists.each do |cartlist|
          cartlist.update(cart_id: user_cart.id)
        end
        session[:cart_id] = nil
        user_cart
      end
    elsif session[:cart_id] == nil
      session_cart = Cart.create!
      session[:cart_id] = session_cart.id
    else
      session_cart = Cart.find(session[:cart_id])
    end
  end

end
