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
  resources :losstop, only: [:index]
  resources :companys, only: [:show, :edit, :update]
  resources :users, only: [:show, :edit, :update]

  resources :bazaars do
    resources :review_bazaars, only: [:create]
    resources :order_bazaars, only: [:new, :create, :show] do
      resources :contact_bazaars, only: [:create]
    end
  end

  resources :auctions do
    resources :review_auctions, only: [:create]
    resources :order_auctions, only: [:new, :create, :show] do
      resources :contact_auctions, only: [:create]
    end
  end
end
