class OrderMailer < ApplicationMailer

  def order_confirmation(order)
    @order = order
    @user = User.find(@order.user_id)
    @greeting = "Thank you for your purchase"

    mail to: @user.email, subject: "Order Id: #{@order.id} has been confirmed"    
  end

  def order_status_update(order)
    @order = order
    @user = User.find(@order.user_id)
    @greeting = "Thank you for your purchase"

    mail to: @user.email, subject: "Order Id: #{@order.id} status has been changed"
  end

end
