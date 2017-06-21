require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'validate password length' do
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'validates unqiueness of' do
    let!(:user) { create(:user) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity}
  end

  describe 'validates first_name presence' do
    it { should validate_presence_of (:first_name) }
  end

  describe 'validates last_name presence' do
    it { should validate_presence_of (:last_name) }
  end

end
