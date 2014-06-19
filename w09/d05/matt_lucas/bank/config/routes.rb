Bank::Application.routes.draw do
  root to: 'welcome#home'

  resources :customers do
    resources :accounts
  end

  get '/sign_up' => 'customers#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'
#
#     customers GET    /customers(.:format)          customers#index
#               POST   /customers(.:format)          customers#create
#  new_customer GET    /customers/new(.:format)      customers#new
# edit_customer GET    /customers/:id/edit(.:format) customers#edit
#      customer GET    /customers/:id(.:format)      customers#show
#               PUT    /customers/:id(.:format)      customers#update
#               DELETE /customers/:id(.:format)      customers#destroy
#       sign_up GET    /sign_up(.:format)            customers#new
#         login GET    /login(.:format)              session#login
end
#== Route Map
# Generated on 23 Nov 2013 21:13
#
#     customers GET    /customers(.:format)          customers#index
#               POST   /customers(.:format)          customers#create
#  new_customer GET    /customers/new(.:format)      customers#new
# edit_customer GET    /customers/:id/edit(.:format) customers#edit
#      customer GET    /customers/:id(.:format)      customers#show
#               PUT    /customers/:id(.:format)      customers#update
#               DELETE /customers/:id(.:format)      customers#destroy
#      accounts GET    /accounts(.:format)           accounts#index
#               POST   /accounts(.:format)           accounts#create
#   new_account GET    /accounts/new(.:format)       accounts#new
#  edit_account GET    /accounts/:id/edit(.:format)  accounts#edit
#       account GET    /accounts/:id(.:format)       accounts#show
#               PUT    /accounts/:id(.:format)       accounts#update
#               DELETE /accounts/:id(.:format)       accounts#destroy
#       sign_up GET    /sign_up(.:format)            customers#new
#         login GET    /login(.:format)              session#new
#               POST   /login(.:format)              session#create
#        logout GET    /logout(.:format)             session#destroy
