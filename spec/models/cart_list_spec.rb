require 'rails_helper'

RSpec.describe CartList, type: :model do
  it { should validate_presence_of(:purchase_quantity) }
  it { should belong_to(:product) }

end
