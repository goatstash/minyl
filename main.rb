require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'
require_relative 'db/db'

enable :sessions

require_relative 'models/user'

require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'

require_relative 'helpers/sessions_helper'


get '/' do
  erb :index
end

get '/users/sign_up' do
  erb :'/users/sign_up'
end

# post '/records' do
#   artist_name = params["artist_name"]
#   album_name = params["album_name"]
#   year = params["year"]
#   img_url = params["img_url"]

#   erb :'/records'
#   add_to_collection(artist_name, album_name, year, img_url)

#   redirect '/'
# end

# get '/records' do
#   "Hello World"
# end


post '/add_records' do
  "Hello World"
  redirect '/'
end

