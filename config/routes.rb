Rails.application.routes.draw do
  resources :purchases, only: [:new, :create]
  resources :inventories, only: [:new, :create, :edit, :update]
  resources :customers, only: [:new, :create, :show]
  resources :products, only: [:index, :show, :new, :create]
  resources :stores, only: [:show]
  get "/purchases/new/:id", to: "purchases#new", as: "new_purchase_w_inventory_id"
  get "/login", to: "customers#login"
  post "/login", to: "customers#process_login"
  get "/logout", to: "customers#logout"
  get "/", to: "customers#homepage", as: "homepage"
  get "stores/:id/owner", to: 'stores#owner_show', as: "store_owner"
  get "/inventory/new"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
