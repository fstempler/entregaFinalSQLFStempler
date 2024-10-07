
DELIMITER $$

-- Vistas
CREATE VIEW view_artist_record AS
SELECT a.artist_name, a.artist_lastName, r.record_title, g.genre_name
FROM artist a
JOIN record r ON a.id_artist = r.id_artist
JOIN genre g ON r.id_genre = g.id_genre $$

CREATE VIEW view_sales_summary AS
SELECT c.customer_name, c.customer_lastName, SUM(sd.price * sd.quantity) AS total_sale, s.sale_date
FROM customer c
JOIN sales s ON c.id_customer = s.id_customer
JOIN sale_detail sd ON s.id_sale = sd.id_sale
GROUP BY c.customer_name, c.customer_lastName, s.sale_date $$

CREATE VIEW view_inventory_status AS
SELECT r.record_title, g.genre_name, i.stock_quantity, i.stock_date
FROM record r
JOIN inventory i ON r.id_record = i.id_record
JOIN genre g ON r.id_genre = g.id_genre $$

CREATE VIEW view_invoice_details AS
SELECT i.id_invoice, i.invoice_date, c.customer_name, c.customer_lastName, i.total_amount
FROM invoice i
JOIN sales s ON i.id_sale = s.id_sale
JOIN customer c ON s.id_customer = c.id_customer $$

CREATE VIEW view_supplier_order_summary AS
SELECT so.id_order, s.supplier_name, so.order_date, SUM(sod.quantity * sod.cost_price) AS total_order_cost
FROM supplier_order so
JOIN supplier s ON so.id_supplier = s.id_supplier
JOIN supplier_order_detail sod ON so.id_order = sod.id_order
GROUP BY so.id_order, s.supplier_name, so.order_date $$

-- Funciones
CREATE FUNCTION get_record_count_by_genre(genre_id INT) 
RETURNS INT
BEGIN
    DECLARE record_count INT;
    SELECT COUNT(*) INTO record_count 
    FROM record
    WHERE id_genre = genre_id;
    RETURN record_count;
END $$

CREATE FUNCTION get_stock_quantity_for_record(record_id INT)
RETURNS INT
BEGIN
    DECLARE stock_quantity INT;
    SELECT stock_quantity INTO stock_quantity 
    FROM inventory 
    WHERE id_record = record_id;
    RETURN stock_quantity;
END $$

-- Stored Procedures
CREATE PROCEDURE add_new_sale(
    IN customer_id INT, 
    IN record_id INT, 
    IN quantity INT, 
    IN payment_method_id INT
)
BEGIN
    DECLARE sale_id INT;

    -- Insertar una nueva venta en la tabla 'sales'
    INSERT INTO sales (id_customer, sale_date, id_payment_method) 
    VALUES (customer_id, NOW(), payment_method_id);
    
    -- Obtener el ID de la venta recién insertada
    SET sale_id = LAST_INSERT_ID();

    -- Insertar los detalles de la venta en 'sale_detail'
    INSERT INTO sale_detail (id_sale, id_record, price, quantity)
    VALUES (sale_id, record_id, 
            (SELECT price FROM inventory WHERE id_record = record_id), 
            quantity);
    
    -- Actualizar el inventario reduciendo la cantidad de stock
    UPDATE inventory 
    SET stock_quantity = stock_quantity - quantity 
    WHERE id_record = record_id;
END $$

CREATE PROCEDURE update_inventory_after_purchase(
    IN record_id INT, 
    IN quantity INT, 
    IN cost_price DECIMAL(10,2)
)
BEGIN
    -- Verificar si el disco ya existe en el inventario
    IF EXISTS (SELECT * FROM inventory WHERE id_record = record_id) THEN
        -- Actualizar el inventario si el disco ya existe
        UPDATE inventory
        SET stock_quantity = stock_quantity + quantity
        WHERE id_record = record_id;
    ELSE
        -- Insertar un nuevo registro en el inventario si no existe
        INSERT INTO inventory (id_record, stock_quantity, stock_date)
        VALUES (record_id, quantity, NOW());
    END IF;

    -- Registrar la compra en 'supplier_order_detail'
    INSERT INTO supplier_order_detail (id_record, quantity, cost_price)
    VALUES (record_id, quantity, cost_price);
END $$

-- Triggers
CREATE TRIGGER before_insert_record
BEFORE INSERT ON record
FOR EACH ROW
BEGIN
    -- Verificar si el título del disco está vacío
    IF NEW.record_title = '' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El título del disco no puede estar vacío.';
    END IF;

    -- Verificar si el ID de género o artista no existe
    IF NOT EXISTS (SELECT 1 FROM genre WHERE id_genre = NEW.id_genre) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El género especificado no existe.';
    END IF;

    IF NOT EXISTS (SELECT 1 FROM artist WHERE id_artist = NEW.id_artist) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'El artista especificado no existe.';
    END IF;
END $$

CREATE TRIGGER after_update_inventory
AFTER UPDATE ON inventory
FOR EACH ROW
BEGIN
    -- Verificar si la cantidad de stock ha cambiado
    IF OLD.stock_quantity <> NEW.stock_quantity THEN
        -- Registrar los cambios en la tabla 'inventory_log'
        INSERT INTO inventory_log (id_record, old_quantity, new_quantity, change_date)
        VALUES (NEW.id_record, OLD.stock_quantity, NEW.stock_quantity, NOW());
    END IF;
END $$


DELIMITER ;
