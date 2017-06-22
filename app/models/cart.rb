class Cart < ApplicationRecord
  belongs_to :user
  has_one :cart_list

end
