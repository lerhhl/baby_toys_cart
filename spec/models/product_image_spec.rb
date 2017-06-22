require 'rails_helper'

RSpec.describe ProductImage, type: :model do
    it { should validate_presence_of(:product_url) }
    it { should belong_to(:product) }
end