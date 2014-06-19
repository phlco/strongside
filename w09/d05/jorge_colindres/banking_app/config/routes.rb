BankingApp::Application.routes.draw do
  root to: 'welcome#index'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  get '/users/:id/deposit' => 'users#deposit', as: 'user_deposit'
  put '/users/:id' => 'users#do_deposit', as: 'do_deposit'

  resources :sessions
  resources :users do
    resources :bank_accounts
  end

end
#== Route Map
# Generated on 24 Nov 2013 23:24
#
#                 signup GET    /signup(.:format)                                users#new
#                  login GET    /login(.:format)                                 sessions#new
#                 logout DELETE /logout(.:format)                                sessions#destroy
#               sessions GET    /sessions(.:format)                              sessions#index
#                        POST   /sessions(.:format)                              sessions#create
#            new_session GET    /sessions/new(.:format)                          sessions#new
#           edit_session GET    /sessions/:id/edit(.:format)                     sessions#edit
#                session GET    /sessions/:id(.:format)                          sessions#show
#                        PUT    /sessions/:id(.:format)                          sessions#update
#                        DELETE /sessions/:id(.:format)                          sessions#destroy
#     user_bank_accounts GET    /users/:user_id/bank_accounts(.:format)          bank_accounts#index
#                        POST   /users/:user_id/bank_accounts(.:format)          bank_accounts#create
#  new_user_bank_account GET    /users/:user_id/bank_accounts/new(.:format)      bank_accounts#new
# edit_user_bank_account GET    /users/:user_id/bank_accounts/:id/edit(.:format) bank_accounts#edit
#      user_bank_account GET    /users/:user_id/bank_accounts/:id(.:format)      bank_accounts#show
#                        PUT    /users/:user_id/bank_accounts/:id(.:format)      bank_accounts#update
#                        DELETE /users/:user_id/bank_accounts/:id(.:format)      bank_accounts#destroy
#                  users GET    /users(.:format)                                 users#index
#                        POST   /users(.:format)                                 users#create
#               new_user GET    /users/new(.:format)                             users#new
#              edit_user GET    /users/:id/edit(.:format)                        users#edit
#                   user GET    /users/:id(.:format)                             users#show
#                        PUT    /users/:id(.:format)                             users#update
#                        DELETE /users/:id(.:format)                             users#destroy
