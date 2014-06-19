MessagesApp::Application.routes.draw do

  root :to => 'messages#index'

  post '/messages' => 'messages#create'

  resources :messages

end
