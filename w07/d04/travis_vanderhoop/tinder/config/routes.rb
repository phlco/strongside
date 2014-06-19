Tinder::Application.routes.draw do
  get '/' => "kitties#index"
  resources :kitties
end
#== Route Map
# Generated on 07 Nov 2013 10:21
#
#            POST   /kitties(.:format)          kitties#create
#  new_kitty GET    /kitties/new(.:format)      kitties#new
# edit_kitty GET    /kitties/:id/edit(.:format) kitties#edit
#      kitty GET    /kitties/:id(.:format)      kitties#show
#            PUT    /kitties/:id(.:format)      kitties#update
#            DELETE /kitties/:id(.:format)      kitties#destroy
