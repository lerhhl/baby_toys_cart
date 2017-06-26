require 'rails_helper'

RSpec.describe Product, type: :model do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_presence_of(:country_of_origin) }
  it { should validate_presence_of(:brand) }
  it { should validate_presence_of(:age_group) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:stock_quantity) }
  
  it { should have_many(:product_images) }
  it { should have_many(:cart_lists) }
  it { should have_many(:orders) }
  it { should have_many(:order_products) }

end
