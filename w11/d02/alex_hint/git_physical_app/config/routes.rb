GitPhysicalApp::Application.routes.draw do
  root to: 'welcome#index'

  namespace :api do
    resources :exercises
  end

end
