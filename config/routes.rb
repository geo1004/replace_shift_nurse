Rails.application.routes.draw do
  get 'matches/index', to: 'matches#index', as: :matches

  get 'matches/:id', to: 'matches#show', as: :match

  devise_for :users
  get '/users/:id', to: 'users#show', as: :user

  get '/seekings', to: 'calendar#seekings', as: :seekings
  get '/availabilities', to: 'calendar#availabilities', as: :availabilities

  get '/shifts/:type', to: 'shifts#index', constraints: {type: /available|seek/}
  resources :shifts
  root 'home#index'
end
