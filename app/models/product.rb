class Product < ApplicationRecord
  validates :name, :price, :country_of_origin, :brand, :age_group, :category, :description, :stock_quantity, presence: true

  # has_many :images, dependent: :destroy
  # has_many :transactions, through: :transaction_products
  # has_many :shopping_lists

end
