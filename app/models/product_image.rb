class ProductImage < ApplicationRecord
  mount_uploader :product_image, ImageUploader

  validates :product_url, presence: true

  belongs_to :product

end