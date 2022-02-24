require 'sinatra'
require 'sinatra/reloader' if development?
require 'pry' if development?
require 'bcrypt'
require_relative 'db/db'

enable :sessions

require_relative 'controllers/records_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/users_controller'
require_relative 'helpers/sessions_helper'
require_relative 'models/records'
require_relative 'models/user'


get '/' do
  user_id = session['user_id']
  records = run_sql("SELECT * FROM collection WHERE user_id = $1 ORDER BY artist_name", [user_id] )

  top_5 = run_sql("SELECT * FROM collection WHERE top_5 = true LIMIT 5")

  arrival = run_sql("SELECT * FROM arrival WHERE user_id = $1 ORDER BY artist_name LIMIT 1", [user_id] )

  erb :index, locals: {
    records: records,
    top_5: top_5,
    arrival: arrival
  }
end

get '/users/sign_up' do
  erb :'/users/sign_up'
end

get '/add_records' do
  erb :'/records/add_records'
end

get '/edit_arrival' do
  erb :'/records/edit_arrival'
end



