require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models.rb'

set :database, {adapter: 'sqlite3', database: 'myblogdb.sqlite3'}

get '/' do
  @posts = Post.all
  erb :index
end

post '/post' do
  @post = Post.create(title: params[:title], body: params[:body])
  redirect '/'
end

get '/post/:id' do
  @post = Post.find(params[:id])
  erb :post_page
end

patch '/post/:id' do
  @post = Post.find(params[:id])
  @post.update(title: params[:title], body: params[:body])
  @post.save
  redirect '/post/'+params[:id]
end

delete '/post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end

get '/user' do
  @users = User.all
  erb :user
end

post '/user' do
  @user = User.create(name: params[:name])
  redirect '/user'
end
