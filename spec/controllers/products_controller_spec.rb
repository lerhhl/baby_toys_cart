require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET #index" do
    let!(:product) { create_list(:product, 10) }

    before do
      get :index
    end

    it { expect(assigns(:products)).to eq(product) }
  end
  
end
