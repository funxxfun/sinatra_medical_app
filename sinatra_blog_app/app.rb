require 'sinatra'
require 'sinatra/activerecord'
require 'sinatra/reloader'
require './models.rb'

enable :sessions

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
  if session[:user_id]
    @post = Post.create(
      title: params[:title],
      body: params[:body],
      user_id: session[:user_id]
    )
    redirect '/'
  else
    erb :login
  end
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
  redirect "/post/#{@post.id}"
end

delete '/post/:id' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/'
end


get '/signup' do
  erb :signup
end

post '/signup' do
  @user = User.create(
    name: params[:name],
    password: params[:password]
  )
  if @user.save
    session[:user_id] = @user.id
    redirect "/user/#{@user.id}"
  else
    erb :signup
  end
end

get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(
    name: params[:name],
    password: params[:password]
  )
  if @user.nil?
    redirect '/login'
  end
  session[:user_id] = @user.id
  redirect "/"
end


get '/user' do
  @users = User.all
  erb :user
end

get '/user/:id' do
  @user = User.find(params[:id])
  # if @user && @user.authenticate(session[:user_id])
    erb :user_show
  # else
    # redirect '/login'
  # end
end

# get '/user_new' do
#   @user = User.new
#   erb :user_new
# end


