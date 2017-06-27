require 'rails_helper'

RSpec.describe Admin::ProductsController, type: :controller do

  describe "GET #show" do
    let(:product) { create(:product) }
    let(:user) { create(:user, is_admin: true) }
    let(:orders) { create_list(:order, 3, user: user) }

    before do
      sign_in user
      get :show, params: { id: product }
    end
    
    it { expect(assigns(:product)).to eq(product) }
  end

  describe "GET #new" do
    let(:product) { create(:product) }
    let(:user) { create(:user, is_admin: true) }

    before do
      sign_in user
      post :new
    end
    
    it { expect(assigns(:product)).to be_a_new_record }
  end

end 