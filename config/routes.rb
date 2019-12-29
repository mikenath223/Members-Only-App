Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/rout
  # resources :users, only: %i[new create edit update]
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  patch '/logout', to: 'sessions#destroy'

  resources :posts, only: %i[new create index]
  
  root 'posts#index'
end
