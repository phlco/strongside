GitPhysicalApp::Application.routes.draw do
  root to: 'welcome#index'

  resources :exercises

# # this is used to group routes
#   namespace :api do
#     resources :exercises
#   end
#   # need to change routes on collections and models to be /api/exercise AND /api/exercises
#     # also need to move controller into a folder titled api within the controller folder (rails)
#     # need to also namespace the class name to be Api::ExercisesController < Applicaiton controller

end
