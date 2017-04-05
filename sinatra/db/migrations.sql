CREATE DATABASE freewifi;

\c freewifi

CREATE TABLE locations (id SERIAL PRIMARY KEY, name varchar(255), address varchar(255));

CREATE TABLE users (id SERIAL PRIMARY KEY, username varchar(255), password_digest varchar(255));

CREATE TABLE comments (id SERIAL PRIMARY KEY, content varchar(255), user_id INT references users(id), location_id INT references locations(id));

