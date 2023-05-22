require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"
require "./models.rb"

set :database, {adapter: "sqlite3", database: "myblogdb.sqlite3"}

get '/' do
  @posts = Post.all
  erb :index
end

post '/post' do
  @post = Post.create(title: params[:title], body: params[:body])
  redirect '/'
end