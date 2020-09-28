Rails.application.routes.draw do
  resources :purchases
  resources :inventories
  resources :customers
  resources :products, only: [:index, :show, :new, :create]
  resources :stores
  get "/purchases/new/:id", to: "purchases#new", as: "new_purchase_w_inventory_id"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
