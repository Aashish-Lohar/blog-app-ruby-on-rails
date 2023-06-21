Rails.application.routes.draw do
  # get 'api/index'
  # get 'test/test'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "articles#index"
  # get "/articles", to: "articles#index"
  # get "/articles/:id", to: "articles#show"
  resources :articles do
    resources :comments
  end
  resources :test

  get "password", to:"password#edit" ,as: :edit_password
  patch "password", to:"password#update"

  get "/api", to: "api#index"

  get "sign_up", to:"registration#new"
  post "sign_up", to:"registration#create"

  get "sign_in", to:"sessions#new"
  post "sign_in", to:"sessions#create"

  get "success", to:"registration#create"
  delete "sign_out", to:"sessions#destroy"

  get "password/reset", to:"password_reset#new"
  post "password/reset", to:"password_reset#create"

  get "password/reset/edit", to:"password_reset#edit"
  patch "password/reset/edit", to:"password_reset#update"
end
