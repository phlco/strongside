MarauderApp::Application.routes.draw do

  get '/' => 'welcome#index'
  get '/signup' => "users#new"
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  resources :users

end
#== Route Map
# Generated on 08 Nov 2013 10:29
#
#    signup GET    /signup(.:format)         users#new
#     login GET    /login(.:format)          session#new
#           POST   /login(.:format)          session#create
#    logout POST   /logout(.:format)         session#destroy
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
