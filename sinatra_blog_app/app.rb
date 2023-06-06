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


get '/signup' do
  @user = User.new
  erb :signup
end

post '/signup' do
  @user = User.create(
    name: params[:name],
    password: params[:password]
  )
  # client.exec_params('insert into users(name, password) values($1, $2)', [name, password])
  # usersテーブルに上で定義した変数(name,email,pass)の中身を入れる。
  if @user.save
    redirect '/'
  else
    erb :signup
  end
end


get '/user' do
  @users = User.all
  erb :user
  # @resにparamsで受け取ったname、email、passを元にusersテーブルからとってきて代入する。
  # @res = client.exec_params('select * from users where name = $1 and password = $2', [name, password]).first
  
  #@res['id'].to_iは@res['id']と取得されるデータが文字列なので整数に変換してsession[:user_id]に代入している。これでsessionに現在ログインしているuseが保持される。
  # session[:user_id] = @res['id'].to_i
end

# post '/user' do
#   @user = User.create(name: params[:name])
#   redirect '/user'
# end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user_show
end



get '/login' do
  erb :login
end

post '/login' do
  name = params[:name]
  if password = params[:password]
    session['name, password'] = params['name, password']
    redirect '/'
  else
    erb :user
  end
end
