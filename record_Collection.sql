CREATE DATABASE IF NOT EXISTS record_collection;
USE record_collection;

CREATE TABLE genre(
    id_genre int(11) NOT NULL AUTO_INCREMENT,
    genre_name varchar(45) DEFAULT NULL,
    PRIMARY KEY(id_genre)
);

CREATE TABLE artist(
    id_artist int(11) NOT NULL AUTO_INCREMENT,
    artist_name varchar(45) DEFAULT NULL,
    artist_lastName varchar(45) DEFAULT NULL,
    PRIMARY KEY(id_artist)
);

CREATE TABLE record(
    id_record int(11) NOT NULL AUTO_INCREMENT,
    record_title varchar(45) NOT NULL,
    id_genre int(11), 
    id_artist int(11),
    PRIMARY KEY(id_record),
    FOREIGN KEY(id_genre) REFERENCES genre(id_genre),
    FOREIGN KEY(id_artist) REFERENCES artist(id_artist)
);

CREATE TABLE year(
    id_year int(11) NOT NULL AUTO_INCREMENT,
    year int(11) NOT NULL,
    PRIMARY KEY(id_year)
);

CREATE TABLE condition(
    id_condition int(11) NOT NULL AUTO_INCREMENT,
    condition_name varchar(45) NOT NULL,
    description TEXT,
    PRIMARY KEY(id_condition)
);

CREATE TABLE edition(
    id_edition int(11) NOT NULL AUTO_INCREMENT,
    edition_name varchar(255),
    id_year int(11) DEFAULT NULL,
    id_record int(11) DEFAULT NULL,
    id_condition int(11) DEFAULT NULL,
    PRIMARY KEY(id_edition),
    FOREIGN KEY(id_year) REFERENCES year(id_year),
    FOREIGN KEY(id_record) REFERENCES record(id_record),
    FOREIGN KEY(id_condition) REFERENCES condition(id_condition)
);