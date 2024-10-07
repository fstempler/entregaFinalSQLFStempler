-- Insertar datos en la tabla 'genre'
INSERT INTO genre (genre_name) VALUES 
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
INSERT INTO artist (artist_name, artist_lastName) VALUES 
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

-- Insertar datos en la tabla 'release_year'
INSERT INTO release_year (year) VALUES 
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
INSERT INTO record_condition (condition_name, description) VALUES 
    ('New', 'Brand new condition, no signs of wear or use.'), 
    ('Used - Like New', 'Used but in excellent condition, almost no signs of wear.'), 
    ('Used - Good', 'Signs of wear but still in good condition.'), 
    ('Used - Fair', 'Visible signs of wear, but still playable.'), 
    ('Collectible', 'Rare edition, may show wear but valuable.'), 
    ('Damaged', 'Significant wear and tear, may not be fully playable.');

-- Insertar datos en la tabla 'record'
INSERT INTO record (record_title, id_genre, id_artist) VALUES 
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

-- Insertar datos en la tabla 'inventory'
INSERT INTO inventory (id_record, stock_quantity, stock_date) VALUES 
    (1, 10, NOW()), 
    (2, 5, NOW()), 
    (3, 15, NOW()), 
    (4, 20, NOW()), 
    (5, 8, NOW()), 
    (6, 12, NOW()), 
    (7, 30, NOW()), 
    (8, 25, NOW()), 
    (9, 10, NOW()), 
    (10, 5, NOW()), 
    (11, 7, NOW()), 
    (12, 3, NOW()), 
    (13, 4, NOW()), 
    (14, 9, NOW()), 
    (15, 11, NOW()), 
    (16, 6, NOW()), 
    (17, 8, NOW()), 
    (18, 10, NOW()), 
    (19, 2, NOW()), 
    (20, 1, NOW());

-- Insertar datos en la tabla 'customer'
INSERT INTO customer (customer_name, customer_lastName, email, phone) VALUES 
    ('Homero', 'Simpson', 'homer@sqltest.com', '1234567890'),
    ('Bobby', 'Brown', 'bob@sqltest.com', '0987654321'),
    ('Vinnie', 'Colaiuta', 'colaiuta@sqltest.com', '2345678901');

-- Insertar datos en la tabla 'payment_method'
INSERT INTO payment_method (method_name) VALUES 
    ('Credit Card'), 
    ('Debit Card'), 
    ('PayPal'), 
    ('Cash');

-- Insertar datos en la tabla 'sales'
INSERT INTO sales (sale_date, id_customer, id_payment_method) VALUES 
    (NOW(), 1, 1),
    (NOW(), 2, 2),
    (NOW(), 3, 3);

-- Insertar datos en la tabla 'sale_detail'
INSERT INTO sale_detail (id_sale, id_record, price, quantity) VALUES 
    (1, 1, 10.00, 1), 
    (1, 2, 15.00, 2), 
    (2, 3, 12.50, 1);

-- Insertar datos en la tabla 'supplier'
INSERT INTO supplier (supplier_name, contact_name, phone, email) VALUES 
    ('Supplier One', 'Ricky Wonderful', '555-1234', 'wonderful@sqltesting.com'),
    ('Supplier Two', 'Marty McFly', '555-5678', 'mmcfly@sqltesting.com');

-- Insertar datos en la tabla 'supplier_order'
INSERT INTO supplier_order (order_date, id_supplier, total_cost) VALUES 
    (NOW(), 1, 200.00),
    (NOW(), 2, 150.00);

-- Insertar datos en la tabla 'supplier_order_detail'
INSERT INTO supplier_order_detail (id_order, id_record, quantity, cost_price) VALUES 
    (1, 1, 10, 8.00),
    (1, 2, 5, 6.00),
    (2, 3, 15, 5.00);
