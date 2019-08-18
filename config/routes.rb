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



# ROUTES
#                    Prefix Verb   URI Pattern                                                                              Controller#Action

#          new_user_session GET    /users/sign_in(.:format)                                                                 devise/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 devise/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                devise/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  devise/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 devise/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    devise/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         devise/registrations#update
#                           PUT    /users(.:format)                                                                         devise/registrations#update
#                           DELETE /users(.:format)                                                                         devise/registrations#destroy
#                           POST   /users(.:format)                                                                         devise/registrations#create

#                      root GET    /                                                                                        pages#home

#                     users GET    /users(.:format)                                                                         users#index
#                           POST   /users(.:format)                                                                         users#create
#                  new_user GET    /users/new(.:format)                                                                     users#new
#                 edit_user GET    /users/:id/edit(.:format)                                                                users#edit
#                      user GET    /users/:id(.:format)                                                                     users#show
#                           PATCH  /users/:id(.:format)                                                                     users#update
#                           PUT    /users/:id(.:format)                                                                     users#update
#                           DELETE /users/:id(.:format)                                                                     users#destroy

#      book_booking_reviews POST   /books/:book_id/bookings/:booking_id/reviews(.:format)                                   reviews#create
#   new_book_booking_review GET    /books/:book_id/bookings/:booking_id/reviews/new(.:format)                               reviews#new
#              book_reviews GET    /books/:book_id/reviews(.:format)                                                        reviews#index
#               book_review GET    /books/:book_id/reviews/:id(.:format)                                                    reviews#show

#             book_bookings GET    /books/:book_id/bookings(.:format)                                                       bookings#index
#                           POST   /books/:book_id/bookings(.:format)                                                       bookings#create
#          new_book_booking GET    /books/:book_id/bookings/new(.:format)                                                   bookings#new
#              book_booking GET    /books/:book_id/bookings/:id(.:format)                                                   bookings#show


#                     books GET    /books(.:format)                                                                         books#index
#                           POST   /books(.:format)                                                                         books#create
#                  new_book GET    /books/new(.:format)                                                                     books#new
#                 edit_book GET    /books/:id/edit(.:format)                                                                books#edit
#                      book GET    /books/:id(.:format)                                                                     books#show
#                           PATCH  /books/:id(.:format)                                                                     books#update
#                           PUT    /books/:id(.:format)                                                                     books#update
#                           DELETE /books/:id(.:format)                                                                     books#destroy
