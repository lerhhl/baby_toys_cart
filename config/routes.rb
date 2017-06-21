Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root "products#index"

  resources :products, only: [:show, :index] do
    resources :images, only: [:show, :index]
  end

  namespace "my" do
    resources :cart, only: [:index] do
      resources :cart_list, except: [:index]
    end
    get :transactions
    get :cart_lists, only: [:index, :show]
  end

  namespace "admin" do
    resources :transactions, except: [:new, :create, :destroy]
    resources :products do
      resources :product_images
    end
  end

end
