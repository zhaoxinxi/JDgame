Rails.application.routes.draw do
  mount Coupons::Engine => '/', as: 'coupons_engine'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :categories
    resources :products
    resources :orders do
      member do
       post :cancel
       post :ship
       post :shipped
       post :return
      end
    end
  end

  resources :products do
    member do
      post :add_to_cart
    end
  end
  resources :carts do
    collection do
      delete :clean
      post :checkout
    end
  end

  namespace :account do
    resources :orders
  end
  resources :product_lists do
    resources :posts
  end

  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
      post :apply_to_cancel
    end
  end
  resources :cart_items

  root 'welcome#index'
end
