BlogApp::Application.routes.draw do

  root to: 'welcome#index'
  get '/github' => "welcome#github"

  resources :users

end
