require 'rails_helper'

RSpec.describe Order, type: :model do
    it { should validate_presence_of(:status) }
    it { should validate_presence_of(:user_id) }  
    
    it { should belong_to(:user) }
    it { should have_many(:products) }
    it { should have_many(:order_products) }
end
