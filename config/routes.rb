Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/rout
  # resources :users, only: %i[new create edit update]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  resources :posts, only: %i[new create index]
  resources :users, only: %i[new create]
  root 'posts#index'
end
