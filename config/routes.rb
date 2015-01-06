Rails.application.routes.draw do
  get 'users/show', to: 'users#show'

  get 'users/edit', to: 'users#edit', as: :edit_user

  patch 'users/:id', to: 'users#update'

  get 'matches/availabilities', to: 'matches#availabilities', as: :matches_availabilities
  get 'matches/seekings', to: 'matches#seekings', as: :matches_seekings

  get 'matches/:id', to: 'matches#show', as: :match

  devise_for :users
  get '/users/:id', to: 'users#show', as: :user

  get '/seekings', to: 'calendar#seekings', as: :seekings
  get '/availabilities', to: 'calendar#availabilities', as: :availabilities

  get '/shifts/:type', to: 'shifts#index', constraints: {type: /available|seek/}
  resources :shifts
  root 'home#index'
end
