class Product < ApplicationRecord
  validates :name, :price, :country_of_origin, :brand, :age_group, :category, :description, :stock_quantity, presence: true

  # enum :country_of_origin: {
  #   "Sg":        Singapore,
  # }

  def country_name
    country = ISO3166::Country[country_of_origin]
    country.translations[I18n.locale.to_s] || country.name
  end

  # has_many :images, dependent: :destroy
  # has_many :transactions, through: :transaction_products
  has_many :cart_lists, dependent: :destroy 

end
