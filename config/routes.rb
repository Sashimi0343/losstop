Rails.application.routes.draw do
  devise_for :companys, controllers: {
    sessions: 'companys/sessions',
    passwords: 'companys/passwords',
    registrations: 'companys/registrations'
  }
  get 'companys/end_list'
  resources :companys, only: %i[show edit update]

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }
  get 'users/end_list'
  resources :users, only: %i[show edit update]


  root to: 'losstops#index'
  resources :losstops, only: [:index]


  get 'bazaars/search'
  resources :bazaars do
    resources :review_bazaars, only: [:create]
    resources :order_bazaars, only: %i[new create show destroy] do
      resources :contact_bazaars, only: [:create]
    end
  end


  get 'auctions/search'
  resources :auctions do
    resources :review_auctions, only: [:create]
    resources :order_auctions, only: %i[new create show destroy] do
      resources :contact_auctions, only: [:create]
    end
  end

  resources :notice_companys, only: :index
end
