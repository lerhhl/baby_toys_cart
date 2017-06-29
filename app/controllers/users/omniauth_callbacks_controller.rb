class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user.persisted?
      Cart.create(user_id: @user.id) unless Cart.find_by(user_id: @user.id)
      sign_in_and_redirect @user, event: :authentication # this will throw if @user is not activated
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      session['devise.facebook_data'] = request.env['omniauth.auth']
      Cart.create(user_id: @user.id)
      redirect_to new_user_registration_url
    end
  end

  def failure
    redirect_to root_path
  end

end
