require 'rails_helper'

RSpec.describe ProductImage, type: :model do
  it { should validate_presence_of(:image_url) }
  it { should belong_to(:product) }
end
