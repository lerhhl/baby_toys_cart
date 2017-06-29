class Order < ApplicationRecord
  validates :status, :user_id, presence: true

  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  enum status: {
    "payment required":     1,
    "payment received":     2,
    "shipped":              3,
    "cancelled":            4
  }

end
