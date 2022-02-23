def add_to_collection(artist_name, user_id, album_name, year, img_url)
    run_sql("INSERT INTO collection(artist_name, user_id, album_name, year, img_url) VALUES($1, $2, $3, $4, $5)", [artist_name, user_id, album_name, year, img_url])
end

def update_to_top_5(vinyl_id)
    run_sql("UPDATE collection SET top_5 = true WHERE id = $1", [vinyl_id])
end

def update_false(fav_id)
    run_sql("UPDATE collection SET top_5 = false WHERE id = $1", [fav_id])
end