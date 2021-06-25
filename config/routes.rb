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


  root to: 'losstops#index'
  resources :losstops, only: [:index]
  resources :companys, only: %i[show edit update]
  resources :users, only: %i[show edit update]

  get 'bazaars/search'
  resources :bazaars do
    resources :review_bazaars, only: [:create]
    resources :order_bazaars, only: %i[new create show] do
      resources :contact_bazaars, only: [:create]
    end
  end

  get 'auctions/search'
  resources :auctions do
    resources :review_auctions, only: [:create]
    resources :order_auctions, only: %i[new create show] do
      resources :contact_auctions, only: [:create]
    end
  end
end
