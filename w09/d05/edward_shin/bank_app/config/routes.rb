BankApp::Application.routes.draw do
  root to: 'welcome#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/signup' => 'users#new'

  resources :users
  resources :accounts
end
