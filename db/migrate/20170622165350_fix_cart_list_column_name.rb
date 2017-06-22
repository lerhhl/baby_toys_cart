class FixCartListColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :cart_lists, :user_id, :cart_id
  end
end
