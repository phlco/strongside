KickhashApiApp::Application.routes.draw do

resources :students

end
#== Route Map
# Generated on 08 Nov 2013 00:36
#
#              POST   /students(.:format)          students#create
#  new_student GET    /students/new(.:format)      students#new
# edit_student GET    /students/:id/edit(.:format) students#edit
#      student GET    /students/:id(.:format)      students#show
#              PUT    /students/:id(.:format)      students#update
#              DELETE /students/:id(.:format)      students#destroy
