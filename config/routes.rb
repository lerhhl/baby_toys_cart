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

  get '/admin/:user_id/user_orders' => 'admin/orders#user_orders', :as => 'user_orders'

  namespace 'admin' do
    resources :orders, except: %i[new create destroy]
    resources :products
    resources :user, only: [:index] do
      resources :orders, only: [:index]
    end
  end

  resource :payments, only: %i[new create show]
end
