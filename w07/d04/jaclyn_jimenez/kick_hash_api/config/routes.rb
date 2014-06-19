KickHashApi::Application.routes.draw do


  root to: "students#index"

  resources :students

end
