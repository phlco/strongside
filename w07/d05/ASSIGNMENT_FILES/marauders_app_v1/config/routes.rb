MaraudersApp::Application.routes.draw do

  root to: 'welcome#index'
  get '/map' => 'welcome#map'

  resources :users

end
