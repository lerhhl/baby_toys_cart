class AddOrderValueToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :order_value, :float, default: 0
  end
end
