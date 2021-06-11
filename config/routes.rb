Rails.application.routes.draw do
  root to: 'losstop#index'

  resources :losstop
end
