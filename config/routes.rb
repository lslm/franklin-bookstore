Rails.application.routes.draw do
  root "shop_items#index"

  devise_for :users, controllers: { registrations: 'registrations' }
  scope :users do
    resources :credit_cards
  end

  resources :items
  resources :banners
  resources :contacts, only: [:new, :create]
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]
  resources :checkouts, param: :slug
  resources :shop_items
  resources :returns

  resources :pages, param: :slug do 
    collection { post :sort }
  end

  scope :admin do
    resources :products
    resources :categories
    resources :stocks
    resources :orders
    resources :return_requests
  end

  get 'all-banners', to: 'banners#display'
  post 'uploads' => 'uploads#create'
end
