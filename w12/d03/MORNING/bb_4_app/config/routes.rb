Bb4App::Application.routes.draw do

  root "welcome#index"

  resources :users
  resources :dogs

  get   "/login",  to: "session#new"
  post  "/login",  to: "session#create"
  get   "/logout", to: "session#destroy"


end
