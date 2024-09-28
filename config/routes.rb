Rails.application.routes.draw do
  resources :orders do
    post "submit", on: :collection, as: "submit"
    resources :order_items, only: [:create, :update], as: "items"
  end

  resources :products

  devise_for :users
  devise_for :admins

  root to: "pages#home"
  get "pages/home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
end
