CREATE DATABASE minyl_db;

\c minyl_db

CREATE TABLE users(id SERIAL PRIMARY KEY, first_name TEXT, last_name TEXT, email TEXT, password_digest TEXT);

CREATE TABLE collection(id SERIAL PRIMARY KEY, artist_name TEXT, album_name TEXT, year INTEGER, img_url TEXT);