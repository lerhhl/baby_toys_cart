class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :email, :provider, :uid ])
  end

  def current_cart
    if current_user
      user_cart = Cart.find_by(user_id: current_user.id)
    end
      session_cart = Cart.find(session[:cart_id])
      rescue ActiveRecord::RecordNotFound


    if !current_user && !session_cart
      session_cart = Cart.create!
      session[:cart_id] = session_cart.id

    elsif !current_user && session_cart
      session_cart

    elsif current_user && user_cart
      user_cart

    elsif current_user && session_cart
      session_cart.update(user_id: current_user.id)
      user_cart = session_cart

    else
      cart = Cart.create(user_id: current_user.id)
      cart = Cart.find_by(user_id: current_user.id)
    end
  end 

end
