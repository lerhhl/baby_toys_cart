require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    should validate_length_of(:password).
    is_at_least(6)
  end

  describe 'validates unqiueness of' do
    let!(:user) { create(:user) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity}
  end  
end
