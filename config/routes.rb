Rails.application.routes.draw do
  get 'matches/index', to: 'matches#index', as: :matches

  get 'matches/:id', to: 'matches#show', as: :match

  devise_for :users
  get '/calendar', to: 'calendar#index', as: :calendar
  get '/shifts/:type', to: 'shifts#index', constraints: {type: /available|seek/}
  resources :shifts
  root 'home#index'
end
