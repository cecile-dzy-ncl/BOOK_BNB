Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users

  resources :books do
    resources :bookings, only: [:index, :show, :new, :create] do
      resources :reviews, only: [:new, :create]
    end
    resources :reviews, only: [:index, :show]
  end

end
