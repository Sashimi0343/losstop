Rails.application.routes.draw do

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
  resources :bazaars do
    resources :order_bazaars
  end
end
