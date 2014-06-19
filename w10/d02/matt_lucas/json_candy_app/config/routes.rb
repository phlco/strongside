JsonCandyApp::Application.routes.draw do

  root to: 'welcome#index'
  get "welcome/index"
  resources :owners
  resources :machines

  match 'machine/:id/sell_candy' => 'machines#sell_candy'
  match 'machine/:id/fill_machine' => 'machines#fill_machine'
  match 'machine/:id/get_money' => 'machines#get_money'

end
#== Route Map
# Generated on 26 Nov 2013 19:06
#
# welcome_index GET    /welcome/index(.:format)     welcome#index
#        owners GET    /owners(.:format)            owners#index
#               POST   /owners(.:format)            owners#create
#     new_owner GET    /owners/new(.:format)        owners#new
#    edit_owner GET    /owners/:id/edit(.:format)   owners#edit
#         owner GET    /owners/:id(.:format)        owners#show
#               PUT    /owners/:id(.:format)        owners#update
#               DELETE /owners/:id(.:format)        owners#destroy
#      machines GET    /machines(.:format)          machines#index
#               POST   /machines(.:format)          machines#create
#   new_machine GET    /machines/new(.:format)      machines#new
#  edit_machine GET    /machines/:id/edit(.:format) machines#edit
#       machine GET    /machines/:id(.:format)      machines#show
#               PUT    /machines/:id(.:format)      machines#update
#               DELETE /machines/:id(.:format)      machines#destroy
#               GET    /sell_candy/:id(.:format)    machines#sell_candy
#               GET    /fill_machine/:id(.:format)  machines#fill_machine
#               GET    /get_money/:id(.:format)     machines#get_money
