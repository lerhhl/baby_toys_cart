require 'rails_helper'

RSpec.describe Cart, type: :model do
  it { should have_one(:cart_list) }
end
