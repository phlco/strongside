CapybaraApp::Application.routes.draw do

  root to: 'welcome#index'
  get '/about' => 'welcome#about'
  get '/javascript' => 'welcome#javascript'
  get '/quizzes' => 'welcome#quizzes'

end
