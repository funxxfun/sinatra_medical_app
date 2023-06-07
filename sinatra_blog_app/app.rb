require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models.rb'
# require 'digest/sha1'
# require 'digest/sha2'
# require 'digest/md5'

set :database, {adapter: 'sqlite3', database: 'myblogdb.sqlite3'}

get '/' do
  @posts = Post.all
  # 投稿したユーザーの名前を表示する記述
  # postのidを取る記述を書き換える
  @post = Post.find(1)
  @user = User.find(@post.user_id)
  erb :index
end

post '/post' do
  @post = Post.create(
    title: params[:title],
    body: params[:body]
  )
  redirect '/'
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @user = User.find(@post.user_id)
  erb :post
end

patch '/post/:id' do
  @post = Post.find(params[:id])
  @post.update(
    title: params[:title],
    body: params[:body]
  )
  @post.save
  redirect '/post/'+params[:id]
end

delete '/post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end


# get '/signup' do
#   @user = User.new
#   erb :signup
# end

# post '/signup' do
#   @user = User.create(
#     name: params[:name],
#     password: params[:password]
#   )
#   if @user.save
#     redirect '/'
#   else
#     erb :signup
#   end
# end


get '/user' do
  @users = User.all
  erb :user
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user_show
end

get '/user_new' do
  @user = User.new
  erb :user_new
end

post '/user_new' do
  @user = User.create(
    name: params[:name],
    password: params[:password]
  )
  if @user.save
    redirect '/user'
  else
    erb :user_new
  end
end


# get '/login' do
#   erb :login
# end

# post '/login' do
#   name = params[:name]
#   if password = params[:password]
#     session['name, password'] = params['name, password']
#     redirect '/'
#   else
#     erb :user
#   end
# end
