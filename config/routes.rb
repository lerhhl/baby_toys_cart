Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks", registrations: 'users/registrations'}

  root "products#index"

  resources :products, only: [:show, :index] do
    resources :images, only: [:show, :index]
  end

  namespace "my" do
    resource :cart
    resource :cart, only: [:index] do
      resources :cart_lists, except: [:index]
    end
    get :transactions
  end

  post '/add_to_cart/:product_id' => 'producs#add_to_cart', :as => 'add_to_cart'

  namespace "admin" do
    resources :transactions, except: [:new, :create, :destroy]
    resources :products do
      resources :product_images
    end
  end

end
