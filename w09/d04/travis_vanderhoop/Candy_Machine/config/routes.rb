CandyMachine::Application.routes.draw do

  resources :owners

end

#== Route Map
# Generated on 21 Nov 2013 19:54
#
#            POST   /owners(.:format)          owners#create
#  new_owner GET    /owners/new(.:format)      owners#new
# edit_owner GET    /owners/:id/edit(.:format) owners#edit
#      owner GET    /owners/:id(.:format)      owners#show
#            PUT    /owners/:id(.:format)      owners#update
#            DELETE /owners/:id(.:format)      owners#destroy
