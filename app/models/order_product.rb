class OrderProduct < ApplicationRecord

  validates :purchase_quantity, presence: true

  belongs_to :product
  belongs_to :order

end
