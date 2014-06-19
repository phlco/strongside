BankAccountApp::Application.routes.draw do

  root to: 'welcome#index'
  get '/transactions' => 'welcome#transactions'
  resources :entries
  resources :users

end
