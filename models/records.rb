def add_to_collection(artist_name, album_name, year, img_url)
    run_sql("INSERT INTO collection(artist_name, album_name, year, img_url) VALUES($1, $2, $3, $4)", [artist_name, album_name, year, img_url])
end