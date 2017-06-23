class FixCartListColumnName < ActiveRecord::Migration[5.1]
  def change
    remove_column :cart_lists, :user_id
  end
end
