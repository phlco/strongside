require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'active_record'
require 'github_api'
require_relative 'programmer'

helpers do
  before  do
    ActiveRecord::Base.logger = Logger.new( STDOUT )

    ActiveRecord::Base.establish_connection(
    :adapter => "postgresql",
    :host => "localhost",
    :username => "quincogdell",
    :password => "",
    :database => "programming_db"
    )
  end

  after do
    ActiveRecord::Base.connection.close
  end

  def github_call(github_username)
      Github.repos.list(user: github_username)
  end

end



get '/' do
  redirect to '/programmers'
end

get '/programmers' do
  @results = Programmer.all.order('id ASC')
  erb :programmers
end

get '/programmers/new' do
  erb :programmers_new
end

get '/programmers/:id' do
  @results = Programmer.find(params[:id])
  #binding.pry
  if @results.github_username !=nil
    @github = github_call(@results.github_username)
  end
  erb :programmers_single
end

get '/programmers/:id/edit' do
  @results = Programmer.find(params[:id])
  erb :programmers_edit
end

post '/programmers' do
  name = params[:name]
  twitter_pic = params[:twitter_pic]
  twitter_username = params[:twitter_username]
  github_username = params[:github_username]
  programmer = Programmer.new(name: name, twitter_pic: twitter_pic, twitter_username: twitter_username, github_username: github_username)
  programmer.save
  redirect to '/programmers'
end

post '/programmers/:id' do
  id = params[:id]
  name = params[:name]
  twitter_pic = params[:twitter_pic]
  twitter_username = params[:twitter_username]
  github_username = params[:github_username]
  programmer = Programmer.find(id)
  programmer.update(name: name, twitter_pic: twitter_pic, twitter_username: twitter_username, github_username: github_username )
  programmer.save
  redirect to '/programmers'
end

post '/programmers/:id/delete' do
  id = params[:id]
  programmer = Programmer.find(id)
  programmer.destroy
  redirect to '/programmers'
end
