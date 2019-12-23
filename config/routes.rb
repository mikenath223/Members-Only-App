Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/rout
  # resources :users, only: %i[new create edit update]
  get '/signup', to: 'sessions#new'
  post '/signup', to: 'sessions#create'
  
end
