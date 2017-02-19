Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  resources :books do
    member do
      post :add_to_basket
    end
    collection do
      get :peoples
      get :story
      get :walks
    end
  end

  namespace :admin do
    resources :books do
      member do
        post :published
        post :hidden
      end
    end
  end

  resources :baskets do
    collection do
      delete :clean
      post :checkout
    end
  end

  resources :basket_items

  resources :orders
  
  namespace :account do
    resources :addresses
  end

  namespace :account do
    resources :orders
  end

  resources :categorys

end
