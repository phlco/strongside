CandyMachineBackboneApp::Application.routes.draw do
  root to: "welcome#index"

  put "/machines/:id/sell" => "machines#sell"
  put "/machines/:id/refill" => "machines#refill"
  put "/machines/:id/cashout" => "machines#cashout"

  resources :machines, :except => [:new, :edit]

end
#== Route Map
# Generated on 26 Nov 2013 18:24
#
#          PUT    /machines/:id/sell(.:format)    machines#sell
#          PUT    /machines/:id/refill(.:format)  machines#refill
#          PUT    /machines/:id/cashout(.:format) machines#cashout
# machines GET    /machines(.:format)             machines#index
#          POST   /machines(.:format)             machines#create
#  machine GET    /machines/:id(.:format)         machines#show
#          PUT    /machines/:id(.:format)         machines#update
#          DELETE /machines/:id(.:format)         machines#destroy
