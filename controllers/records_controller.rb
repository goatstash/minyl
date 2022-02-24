post '/create_records' do
    artist_name = params["artist_name"]
    album_name = params["album_name"]
    year = params["year"]
    img_url = params["img_url"]
    user_id = session["user_id"]
    add_to_collection(artist_name, user_id, album_name, year, img_url)

    redirect '/'
end

get '/edit_top_five' do
    user_id = session['user_id']
    records = run_sql("SELECT * FROM collection WHERE user_id = $1", [user_id] )

    erb :'/records/edit_top_five', locals: {
        records: records
    }
end

post '/edit_favourites' do
    vinyl_id = params['vinyl_id']
    update_to_top_5(vinyl_id)
    redirect '/'
end

post '/remove_from_top_5' do
    fav_id = params['fav_id']
    update_false(fav_id)
    redirect '/'
end

get '/edit_collection' do
    user_id = session['user_id']
    records = run_sql("SELECT * FROM collection WHERE user_id = $1", [user_id])
    erb :'/records/edit_collection', locals: {
        records: records
    }
end

delete '/delete_from_collection' do
    id = params["id"]

    run_sql("DELETE FROM collection WHERE id = $1", [id])
    redirect '/'
end

  post '/create_arrival' do
    artist_name = params["artist_name"]
    album_name = params["album_name"]
    year = params["year"]
    img_url = params["img_url"]
    user_id = session["user_id"]
    add_to_arrival(artist_name,     user_id, album_name, year, img_url)

    redirect '/'
  end

  delete '/delete_from_arrival' do
    id = params["id"]

    run_sql("DELETE FROM arrival WHERE id = $1", [id])
    
    redirect '/'
end

