class Product < ApplicationRecord

  validates :name, :price, :country_of_origin, :brand, :age_group, :category, :description, :stock_quantity, presence: true

  has_many :product_images, dependent: :destroy
  has_many :cart_lists, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products

  def country_name
    country = ISO3166::Country[country_of_origin]
    country.translations[I18n.locale.to_s] || country.name
  end

end
