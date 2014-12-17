Rails.application.routes.draw do
  devise_for :users
  get '/calendar', to: 'calendar#index', as: :calendar
  get '/shifts/:type', to: 'shifts#index', constraints: {type: /available|seek/}
  resources :shifts
  root 'home#index'
end
