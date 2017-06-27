require 'rails_helper'
require 'products_controller'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    let!(:products) { create_list(:product, 10) }

    before do
      get :index
    end

    it { expect(assigns(:products)).to eq(products) }
  end
  
  describe "GET #show" do
    let(:product) { create(:product) }

    before do
      get :show, params: { id: product }
    end
    
    it { expect(assigns(:product)).to eq(product) }
  end

end
