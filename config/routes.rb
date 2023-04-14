require "sidekiq/web"

Rails.application.routes.draw do
  mount Sidekiq::Web => "/sidekiq" if Rails.env.development?

  devise_for :users
  resources :comments

  resources :movies do
    resources :comments, only: [:new]
  end

  root to: "welcome#index", as: :welcome_home

  get "developers", to: "developers#index"
  post "/developers", to: "developers#create_key"
end
