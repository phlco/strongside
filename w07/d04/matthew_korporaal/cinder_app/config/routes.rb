CinderApp::Application.routes.draw do
  resources :cats

  root :to => 'cats#index'


end
#== Route Map
# Generated on 07 Nov 2013 11:49
#
#          POST   /cats(.:format)          cats#create
#  new_cat GET    /cats/new(.:format)      cats#new
# edit_cat GET    /cats/:id/edit(.:format) cats#edit
#      cat GET    /cats/:id(.:format)      cats#show
#          PUT    /cats/:id(.:format)      cats#update
#          DELETE /cats/:id(.:format)      cats#destroy
#     root        /                        cats#index
