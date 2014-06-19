MarauderApp::Application.routes.draw do

  root to:'welcome#index'
  resources :users

end
#== Route Map
# Generated on 08 Nov 2013 11:00
#
# user_index GET    /user(.:format)          user#index
#            POST   /user(.:format)          user#create
#   new_user GET    /user/new(.:format)      user#new
#  edit_user GET    /user/:id/edit(.:format) user#edit
#       user GET    /user/:id(.:format)      user#show
#            PUT    /user/:id(.:format)      user#update
#            DELETE /user/:id(.:format)      user#destroy
