CappyHamlApp::Application.routes.draw do
  root to: 'welcome#index'
  get '/haml'     => 'welcome#haml'
  get '/quiz'     => 'welcome#quiz'
  post '/random'  => 'welcome#random'
end
