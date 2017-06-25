class My::CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cartlists = CartList.where(user_id: current_user.id)
  end

end
