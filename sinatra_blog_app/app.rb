require "sinatra"
require "sinatra/activerecord"
require "sinatra/reloader"

set :database, {adapter: "sqlite3", database: "myblogdb.sqlite3"}
