Kinder::Application.routes.draw do

root :to => 'cats#index'

resources 'cats'

end
#== Route Map
# Generated on 07 Nov 2013 10:44
#
#     cats GET    /cats(.:format)          cats#index
#          POST   /cats(.:format)          cats#create
#  new_cat GET    /cats/new(.:format)      cats#new
# edit_cat GET    /cats/:id/edit(.:format) cats#edit
#      cat GET    /cats/:id(.:format)      cats#show
#          PUT    /cats/:id(.:format)      cats#update
#          DELETE /cats/:id(.:format)      cats#destroy
