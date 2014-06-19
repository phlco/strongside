require 'sinatra'
require 'sinatra/reloader' if development?

get '/' do
  "hello"
end


get '/plan'  do

  erb :plan
end

