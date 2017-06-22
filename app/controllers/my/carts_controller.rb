class My::CartsController < ApplicationController

  def show
    @cartlist = CartList.where(user_id: current_user.id)
  end

end
