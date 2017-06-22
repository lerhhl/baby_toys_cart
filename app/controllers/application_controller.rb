class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :email, :provider, :uid ])
  end

  # def current_cart
  #   Cart.find(session[:cart_id])
  #   rescue ActiveRecord::RecordNotFound
  #   cart = Cart.create
  #   session[:cart_id] = cart.id
  # end


  # def current_cart
  #   if session[:cart_id]
  #     @current_cart ||= Cart.find([:user_id])
  #   end
  #   if session[:cart_id].nil?
  #     @current_cart = Cart.create!
  #     session[:cart_id] = @current_cart.id
  #   end
  #   @current_cart
  # end

  # def current_cart
  #   @user = current_user
  #   if current_user.present? && Cart.find_by(user_id: @user.id) != nil
  #     cart = Cart.find_by(user_id: @user.id)
  #     session[:cart_id] = cart.id
  #     cart.save
  #     Cart.find(session[:cart_id])
  #   else
  #     cart = Cart.create!
  #     session[:cart_id] = cart.id
  #   end
  # end

  def current_cart
    # if user is logged in
      @user = current_user
      # checking user to see if account is confirmed and verified

        # checking if user already has cart in cart database
        if Cart.find_by(user_id: @user) != nil
          # find a row in the database where users_id: equal to @user.id
          # where clause does not work here
          cart = Cart.find_by(user_id: @user)
          session[:cart_id] = cart.id
          cart.save
          #establish Cart session cart for user
          Cart.find(session[:cart_id])
        else
          # create a new Cart Object for user.assign current_user's id to cart object
          cart = Cart.new
          cart.user_id = @user
          # save it to get cart id assign session[:cart_id] == cart.id
          cart.save
          session[:cart_id] = cart.id
        end
      end


end
