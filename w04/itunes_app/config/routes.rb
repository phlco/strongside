ItunesApp::Application.routes.draw do

  resources :songs
  resources :users do
    resources :songs
  end
  resources :purchases
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
#== Route Map
# Generated on 21 Oct 2013 07:07
#
#                POST   /songs(.:format)                         songs#create
#       new_song GET    /songs/new(.:format)                     songs#new
#      edit_song GET    /songs/:id/edit(.:format)                songs#edit
#           song GET    /songs/:id(.:format)                     songs#show
#                PUT    /songs/:id(.:format)                     songs#update
#                DELETE /songs/:id(.:format)                     songs#destroy
#     user_songs GET    /users/:user_id/songs(.:format)          songs#index
#                POST   /users/:user_id/songs(.:format)          songs#create
#  new_user_song GET    /users/:user_id/songs/new(.:format)      songs#new
# edit_user_song GET    /users/:user_id/songs/:id/edit(.:format) songs#edit
#      user_song GET    /users/:user_id/songs/:id(.:format)      songs#show
#                PUT    /users/:user_id/songs/:id(.:format)      songs#update
#                DELETE /users/:user_id/songs/:id(.:format)      songs#destroy
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#       new_user GET    /users/new(.:format)                     users#new
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user GET    /users/:id(.:format)                     users#show
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy
#      purchases GET    /purchases(.:format)                     purchases#index
#                POST   /purchases(.:format)                     purchases#create
#   new_purchase GET    /purchases/new(.:format)                 purchases#new
#  edit_purchase GET    /purchases/:id/edit(.:format)            purchases#edit
#       purchase GET    /purchases/:id(.:format)                 purchases#show
#                PUT    /purchases/:id(.:format)                 purchases#update
#                DELETE /purchases/:id(.:format)                 purchases#destroy
