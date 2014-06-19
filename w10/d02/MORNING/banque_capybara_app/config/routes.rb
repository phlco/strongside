BanqueCapybaraApp::Application.routes.draw do

  root to: 'welcome#index'

  get   'sign_up'    => 'users#new',       as: :signup
  get   'login'      => 'session#new',     as: :login
  post  'login'      => 'session#create'
  get   'logout'     => 'session#destroy', as: :logout
  get   '/dashboard' => 'users#show',      as: :dashboard

  resources :users, only: [:create]

  resources :accounts, only: [:index, :new, :create, :show] do
    post 'deposit'  => 'accounts#deposit'
    post 'withdraw' => 'accounts#withdraw'
  end

end
