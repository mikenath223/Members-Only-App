Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/rout
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
