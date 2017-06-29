Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks', registrations: 'users/registrations' }
  root 'products#index'

  resources :products, only: %i[show index]

  namespace 'my' do
    resource :cart
    resource :cart, only: [:index] do
      resources :cart_lists, except: [:index]
    end
    resources :orders
  end

  post '/add_to_cart/:product_id' => 'producs#add_to_cart', :as => 'add_to_cart'

  namespace 'admin' do
    resources :orders, except: %i[new create destroy]
    resources :products
  end

  resource :payments, only: %i[new create show]
end
