require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"
require "./models.rb"

set :database, {adapter: "sqlite3", database: "myblogdb.sqlite3"}
