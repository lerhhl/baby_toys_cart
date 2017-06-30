class Users::RegistrationsController < Devise::RegistrationsController

  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  def new
    super
  end

  def create
    super
    OrderMailer.user_confirmation(@user).deliver_now
    Cart.create(user_id: @user.id)
  end

  def edit
    super
  end

  def update
    super
    # @user = User.find(current_user.id)
    # email_changed = @user.email != params[:user][:email]
    # is_facebook_account = !@user.provider.blank?
    #
    # successfully_updated = if !is_facebook_account
    #   @user.update_with_password(params[:user])
    # else
    #   @user.update_without_password(params[:user])
    # end
    #
    # if successfully_updated
    #   sign_in @user, :bypass => true
    #   redirect_to root_path
    # else
    #   render "edit"
    # end
  end

  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  #   def after_sign_up_path_for(resource)
  #     edit_user_registration_path(resource)
  #   end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

end
