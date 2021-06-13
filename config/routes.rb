Rails.application.routes.draw do
  get 'bazaars/index'
  get 'bazaars/new'
  get 'bazaars/create'
  devise_for :companys, controllers: {
    sessions: 'companys/sessions',
    passwords: 'companys/passwords',
    registrations: 'companys/registrations'
  }
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  root to: 'losstop#index'

  resources :losstop
  resources :bazaars
end
