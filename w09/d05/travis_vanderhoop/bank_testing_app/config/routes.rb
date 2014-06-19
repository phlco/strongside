BankTesting::Application.routes.draw do
  devise_for :users

  root :to => 'welcome#index'

  resources :users do
    resources :accounts
  end



end
#== Route Map
# Generated on 23 Nov 2013 10:19
#
#             user_session POST   /users/sign_in(.:format)                    devise/sessions#create
#     destroy_user_session DELETE /users/sign_out(.:format)                   devise/sessions#destroy
#            user_password POST   /users/password(.:format)                   devise/passwords#create
#        new_user_password GET    /users/password/new(.:format)               devise/passwords#new
#       edit_user_password GET    /users/passwo rd/edit(.:format)              devise/passwords#edit
#                          PUT    /users/password(.:format)                   devise/passwords#update
# cancel_user_registration GET    /users/cancel(.:format)                     devise/registrations#cancel
#        user_registration POST   /users(.:format)                            devise/registrations#create
#    new_user_registration GET    /users/sign_up(.:format)                    devise/registrations#new
#   edit_user_registration GET    /users/edit(.:format)                       devise/registrations#edit
#                          PUT    /users(.:format)                            devise/registrations#update
#                          DELETE /users(.:format)                            devise/registrations#destroy
#                     root        /                                           welcome#index
#            user_accounts GET    /users/:user_id/accounts(.:format)          accounts#index
#                          POST   /users/:user_id/accounts(.:format)          accounts#create
#         new_user_account GET    /users/:user_id/accounts/new(.:format)      accounts#new
#        edit_user_account GET    /users/:user_id/accounts/:id/edit(.:format) accounts#edit
#             user_account GET    /users/:user_id/accounts/:id(.:format)      accounts#show
#                          PUT    /users/:user_id/accounts/:id(.:format)      accounts#update
#                          DELETE /users/:user_id/accounts/:id(.:format)      accounts#destroy
#                    users GET    /users(.:format)                            users#index
#                          POST   /users(.:format)                            users#create
#                 new_user GET    /users/new(.:format)                        users#new
#                edit_user GET    /users/:id/edit(.:format)                   users#edit
#                     user GET    /users/:id(.:format)                        users#show
#                          PUT    /users/:id(.:format)                        users#update
#                          DELETE /users/:id(.:format)                        users#destroy
