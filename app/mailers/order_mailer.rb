class OrderMailer < ApplicationMailer

  def order_confirmation(order)
    @order = order
    @user = User.find(@order.user_id)
    @greeting = 'Thank you for your purchase'

    mail to: @user.email, subject: "Order Id: #{@order.id} has been confirmed"
  end

  def order_status_update(order)
    @order = order
    @user = User.find(@order.user_id)
    @greeting = 'Thank you for your purchase'

    mail to: @user.email, subject: "Order Id: #{@order.id} status has been changed"
  end

  def user_confirmation(user)
    @user = user
    mail to: @user.email, subject: 'Your Baby Toys online account is created.'
  end

  def payment_received(order)
    @order = order
    @user = User.find(@order.user_id)
    mail to: @user.email, subject: "Your payment for Order Id: #{@order.id} has been received"
  end

  def payment_rejected(order)
    @order = order
    @user = User.find(@order.user_id)
    mail to: @user.email, subject: "Your payment for Order Id: #{@order.id} has failed."
  end

end
