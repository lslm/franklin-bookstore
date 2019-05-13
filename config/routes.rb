Rails.application.routes.draw do
  root "shop_items#index"

  devise_for :users

  resources :items
  resources :banners
  resources :contacts, only: [:new, :create]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :orders, except: [:edit, :update, :destroy]
  resources :checkouts, except: [:edit, :update, :destroy], param: :slug
  resources :shop_items
  
  resources :pages, param: :slug do 
    collection { post :sort }
  end

  scope :admin do
    resources :checkouts
    resources :products
    resources :categories
    resources :stocks
  end

  get 'all-banners', to: 'banners#display'
  post 'uploads' => 'uploads#create'
end
