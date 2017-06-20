Rails.application.routes.draw do
  devise_for :users

  root "products#index"
  
  resources :products, only: [:show, :index] do
    resources :images, only: [:show, :index]
  end
  
  namespace "my" do
    resources :shopping_cart, only: [:index] do
      resources :shopping_list, except: [:index]
    end
    get :transactions
    get :shopping_lists, only: [:index, :show]
  end

  namespace "admin" do
    resources :transactions, except: [:new, :create, :destroy]
    resources :products do
      resources :product_images
    end
  end
end
