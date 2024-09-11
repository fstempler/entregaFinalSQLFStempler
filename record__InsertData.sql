-- Insertar datos en la tabla 'genre'
INSERT INTO genre (genre_name) 
VALUES 
    ('Rock'), 
    ('Jazz'), 
    ('Pop'), 
    ('Classical'), 
    ('Blues'), 
    ('Hip Hop'), 
    ('Reggae'), 
    ('Folk'), 
    ('Metal'), 
    ('Country'), 
    ('R&B'), 
    ('Electronic'), 
    ('Soul'), 
    ('Funk'), 
    ('Punk');

-- Insertar datos en la tabla 'artist'
INSERT INTO artist (artist_name, artist_lastName) 
VALUES 
    ('John', 'Lennon'), 
    ('Miles', 'Davis'), 
    ('Freddie', 'Mercury'), 
    ('Ludwig', 'Beethoven'), 
    ('B.B.', 'King'), 
    ('Bob', 'Marley'), 
    ('Elvis', 'Presley'), 
    ('David', 'Bowie'), 
    ('Kurt', 'Cobain'), 
    ('Tupac', 'Shakur'), 
    ('Michael', 'Jackson'), 
    ('Adele', NULL), 
    ('Beyoncé', NULL), 
    ('Johnny', 'Cash'), 
    ('Taylor', 'Swift'), 
    ('Jimi', 'Hendrix'), 
    ('Aretha', 'Franklin'), 
    ('Prince', NULL), 
    ('Eminem', NULL), 
    ('Ray', 'Charles');

-- Insertar datos en la tabla 'record'
INSERT INTO record (record_title, id_genre, id_artist) 
VALUES 
    ('Imagine', 1, 1), 
    ('Kind of Blue', 2, 2), 
    ('Bohemian Rhapsody', 3, 3), 
    ('Symphony No. 5', 4, 4), 
    ('The Thrill Is Gone', 5, 5), 
    ('No Woman No Cry', 7, 6), 
    ('Blue Suede Shoes', 1, 7), 
    ('Space Oddity', 1, 8), 
    ('Smells Like Teen Spirit', 9, 9), 
    ('California Love', 6, 10), 
    ('Thriller', 3, 11), 
    ('Someone Like You', 3, 12), 
    ('Crazy in Love', 11, 13), 
    ('Ring of Fire', 10, 14), 
    ('Shake It Off', 3, 15), 
    ('Purple Haze', 9, 16), 
    ('Respect', 13, 17), 
    ('Purple Rain', 13, 18), 
    ('Lose Yourself', 6, 19), 
    ('Georgia on My Mind', 13, 20), 
    ('Billie Jean', 3, 11), 
    ('Hurt', 10, 14), 
    ('Jailhouse Rock', 1, 7);

-- Insertar datos en la tabla 'release_year'
INSERT INTO release_year (year) 
VALUES 
    (1971), 
    (1959), 
    (1975), 
    (1808), 
    (1969), 
    (1973), 
    (1983), 
    (1991), 
    (2003), 
    (1961), 
    (1982), 
    (2011), 
    (2004), 
    (1956), 
    (1979), 
    (1996), 
    (1965), 
    (1992), 
    (1962), 
    (1958), 
    (1984), 
    (1995), 
    (2001);

-- Insertar datos en la tabla 'record_condition'
INSERT INTO record_condition (condition_name, description) 
VALUES 
    ('New', 'Brand new condition, no signs of wear or use.'), 
    ('Used - Like New', 'Used but in excellent condition, almost no signs of wear.'), 
    ('Used - Good', 'Signs of wear but still in good condition.'), 
    ('Used - Fair', 'Visible signs of wear, but still playable.'), 
    ('Collectible', 'Rare edition, may show wear but valuable.'), 
    ('Damaged', 'Significant wear and tear, may not be fully playable.');

-- Insertar datos en la tabla 'edition'
INSERT INTO edition (edition_name, id_year, id_record, id_condition) 
VALUES 
    ('First Pressing', 1, 1, 1), 
    ('Remastered Edition', 2, 2, 2), 
    ('Limited Edition', 3, 3, 3), 
    ('Original Release', 4, 4, 4), 
    ('Anniversary Edition', 5, 5, 5), 
    ('Collector’s Edition', 6, 6, 3), 
    ('Reissue', 7, 7, 2), 
    ('Special Edition', 8, 8, 1), 
    ('Deluxe Edition', 9, 9, 2), 
    ('Vinyl Reissue', 10, 10, 3), 
    ('Box Set', 11, 11, 5), 
    ('Live Recording', 12, 12, 3), 
    ('Single Edition', 13, 13, 2), 
    ('Standard Edition', 14, 14, 1), 
    ('Ultimate Edition', 15, 15, 2), 
    ('Radio Broadcast', 16, 16, 4), 
    ('Digitally Remastered', 17, 17, 1), 
    ('Acoustic Version', 18, 18, 3), 
    ('Extended Play', 19, 19, 2), 
    ('Special Collector’s Edition', 20, 20, 5);
