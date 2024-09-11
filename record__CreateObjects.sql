-- Vistas
CREATE VIEW view_artist_record AS
SELECT a.artist_name, a.artist_lastName, r.record_title, g.genre_name
FROM artist a
JOIN record r ON a.id_artist = r.id_artist
JOIN genre g ON r.id_genre = g.id_genre;

CREATE VIEW view_edition_details AS
SELECT e.edition_name, r.record_title, y.year, c.condition_name
FROM edition e
JOIN record r ON e.id_record = r.id_record
JOIN release_year y ON e.id_year = y.id_year
JOIN record_condition c ON e.id_condition = c.id_condition;

DELIMITER $$

-- Funciones
CREATE FUNCTION get_record_count_by_genre(genre_id INT) 
RETURNS INT
BEGIN
    DECLARE record_count INT;
    SELECT COUNT(*) INTO record_count 
    FROM record
    WHERE id_genre = genre_id;
    RETURN record_count;
END$$

CREATE FUNCTION get_artist_full_name(artist_id INT) 
RETURNS VARCHAR(90)
BEGIN
    DECLARE full_name VARCHAR(90);
    SELECT CONCAT(artist_name, ' ', artist_lastName) INTO full_name
    FROM artist 
    WHERE id_artist = artist_id;
    RETURN full_name;
END$$

-- Stored Procedures
CREATE PROCEDURE add_new_record(
    IN title VARCHAR(45), 
    IN genre_id INT, 
    IN artist_id INT
)
BEGIN
    INSERT INTO record (record_title, id_genre, id_artist)
    VALUES (title, genre_id, artist_id);
END$$

CREATE PROCEDURE update_record_condition(
    IN edition_id INT, 
    IN new_condition_id INT
)
BEGIN
    UPDATE edition 
    SET id_condition = new_condition_id
    WHERE id_edition = edition_id;
END$$

-- Triggers
CREATE TRIGGER before_insert_record
BEFORE INSERT ON record
FOR EACH ROW
BEGIN
    IF NEW.record_title = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El título del disco no puede estar vacío.';
    END IF;
END$$

CREATE TRIGGER after_update_condition
AFTER UPDATE ON edition
FOR EACH ROW
BEGIN
    INSERT INTO condition_changes (id_edition, change_date, new_condition)
    VALUES (NEW.id_edition, NOW(), NEW.id_condition);
END$$

-- Restablece el delimitador a su valor por defecto
DELIMITER ;