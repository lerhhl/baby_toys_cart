class Product < ApplicationRecord
  validates :name, :price, :country_of_origin, :brand, :age_group, :category, :description, :stock_quantity, presence: true

  # enum :country_of_origin: {
  #   "Draft":        1,
  #   "Published":    2,
  #   "Abandoned":    3,
  # }

  def country_name
    country = ISO3166::Country[country_of_origin]
    country.translations[I18n.locale.to_s] || country.name
  end

  has_many :product_images, dependent: :destroy
  # has_many :transactions, through: :transaction_products
  # has_many :shopping_lists

end