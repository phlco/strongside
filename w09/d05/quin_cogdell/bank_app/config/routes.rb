BanqueApp::Application.routes.draw do

  root to: 'session#new'

  resources :users
  resources :accounts

  # resources :sessions, only: [:new, :create, :destroy]

  get '/signup' => 'users#new'
  get '/login' => 'session#new', as: :login
  post '/login' => 'session#create'
  get '/logout' => 'session#destroy'

  get '/login' => 'session#new'
  get '/logout' => 'session#destroy'

end
