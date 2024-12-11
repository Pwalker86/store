Rails.application.routes.draw do
  devise_for :super_users
  resources :orders, only: [ :index, :show, :update ] do
    get "checkout", as: "checkout"
    post "submit", as: "submit"
    get "confirmation", as: "confirmation"
    resources :order_items, only: [ :create, :update ], as: "items"
  end


  resources :stores do
    resources :products
  end

  devise_for :users
  devise_for :admins

  resources :user  do
    resource :cart, only: [ :show, :edit, :update, :destroy ]
  end

  root to: "pages#home"
  get "pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", :as => :rails_health_check
end
