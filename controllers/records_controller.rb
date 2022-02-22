post '/add_records' do
    artist_name = params["artist_name"]
    album_name = params["album_name"]
    year = params["year"]
    img_url = params["img_url"]
    add_to_collection(artist_name, album_name, year, img_url)
  end

  get '/records/add_records' do
    "Hello World"
  end