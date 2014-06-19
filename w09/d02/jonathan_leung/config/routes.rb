Pokemon::Application.routes.draw do

  resources :trainers
  resources :monsters

end
#== Route Map
# Generated on 22 Nov 2013 17:19
#
#              POST   /trainers(.:format)          trainers#create
#  new_trainer GET    /trainers/new(.:format)      trainers#new
# edit_trainer GET    /trainers/:id/edit(.:format) trainers#edit
#      trainer GET    /trainers/:id(.:format)      trainers#show
#              PUT    /trainers/:id(.:format)      trainers#update
#              DELETE /trainers/:id(.:format)      trainers#destroy
#     monsters GET    /monsters(.:format)          monsters#index
#              POST   /monsters(.:format)          monsters#create
#  new_monster GET    /monsters/new(.:format)      monsters#new
# edit_monster GET    /monsters/:id/edit(.:format) monsters#edit
#      monster GET    /monsters/:id(.:format)      monsters#show
#              PUT    /monsters/:id(.:format)      monsters#update
#              DELETE /monsters/:id(.:format)      monsters#destroy
