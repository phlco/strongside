CarpathiaApp::Application.routes.draw do

  get '/' => "welcome#index"

  get '/users/:id/dashboard' => 'users#dashboard'

  resources :users

end
