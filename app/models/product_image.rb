class ProductImage < ApplicationRecord
  mount_uploader :image_url, ImageUploader

  validates :image_url, presence: true

  belongs_to :product

end