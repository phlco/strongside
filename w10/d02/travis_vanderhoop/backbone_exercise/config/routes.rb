BackboneExercise::Application.routes.draw do
  get '/' => "users#index"

  resources :users
end
#== Route Map
# Generated on 26 Nov 2013 17:19
#
#     users GET    /users(.:format)          users#index
#           POST   /users(.:format)          users#create
#  new_user GET    /users/new(.:format)      users#new
# edit_user GET    /users/:id/edit(.:format) users#edit
#      user GET    /users/:id(.:format)      users#show
#           PUT    /users/:id(.:format)      users#update
#           DELETE /users/:id(.:format)      users#destroy
