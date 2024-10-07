CREATE DATABASE IF NOT EXISTS record_collection;
USE record_collection;

-- Tabla de géneros
CREATE TABLE genre(
    id_genre int(11) NOT NULL AUTO_INCREMENT,
    genre_name varchar(45) DEFAULT NULL,
    PRIMARY KEY(id_genre)
);

-- Tabla de artistas
CREATE TABLE artist(
    id_artist int(11) NOT NULL AUTO_INCREMENT,
    artist_name varchar(45) DEFAULT NULL,
    artist_lastName varchar(45) DEFAULT NULL,
    PRIMARY KEY(id_artist)
);

-- Tabla de discos
CREATE TABLE record(
    id_record int(11) NOT NULL AUTO_INCREMENT,
    record_title varchar(45) NOT NULL,
    id_genre int(11), 
    id_artist int(11),
    PRIMARY KEY(id_record),
    FOREIGN KEY(id_genre) REFERENCES genre(id_genre),
    FOREIGN KEY(id_artist) REFERENCES artist(id_artist)
);

-- Tabla de años de lanzamiento
CREATE TABLE release_year(
    id_year int(11) NOT NULL AUTO_INCREMENT,
    year int(11) NOT NULL,
    PRIMARY KEY(id_year)
);

-- Tabla de condiciones físicas de los discos
CREATE TABLE record_condition(
    id_condition int(11) NOT NULL AUTO_INCREMENT,
    condition_name varchar(45) NOT NULL,
    description TEXT,
    PRIMARY KEY(id_condition)
);

-- Tabla de ediciones de discos
CREATE TABLE edition (
    id_edition int(11) NOT NULL AUTO_INCREMENT,
    edition_name varchar(255),
    id_year int(11) DEFAULT NULL,
    id_record int(11) DEFAULT NULL,
    id_condition int(11) DEFAULT NULL,
    PRIMARY KEY(id_edition),
    FOREIGN KEY(id_year) REFERENCES release_year(id_year),
    FOREIGN KEY(id_record) REFERENCES record(id_record),
    FOREIGN KEY(id_condition) REFERENCES record_condition(id_condition)
);

-- Tabla de clientes
CREATE TABLE customer(
    id_customer int(11) NOT NULL AUTO_INCREMENT,
    customer_name varchar(45) NOT NULL,
    customer_lastName varchar(45) NOT NULL,
    email varchar(100) NOT NULL,
    phone varchar(20),
    PRIMARY KEY(id_customer)
);

-- Tabla de métodos de pago
CREATE TABLE payment_method(
    id_payment_method int(11) NOT NULL AUTO_INCREMENT,
    method_name varchar(45) NOT NULL,
    PRIMARY KEY(id_payment_method)
);

-- Tabla de ventas
CREATE TABLE sales(
    id_sale int(11) NOT NULL AUTO_INCREMENT,
    sale_date DATETIME NOT NULL,
    id_customer int(11),
    id_payment_method int(11),
    PRIMARY KEY(id_sale),
    FOREIGN KEY(id_customer) REFERENCES customer(id_customer),
    FOREIGN KEY(id_payment_method) REFERENCES payment_method(id_payment_method)
);

-- Tabla de detalles de ventas (para relacionar ventas con discos comprados)
CREATE TABLE sale_detail(
    id_sale_detail int(11) NOT NULL AUTO_INCREMENT,
    id_sale int(11),
    id_record int(11),
    price DECIMAL(10,2) NOT NULL,
    quantity int(11) NOT NULL,
    PRIMARY KEY(id_sale_detail),
    FOREIGN KEY(id_sale) REFERENCES sales(id_sale),
    FOREIGN KEY(id_record) REFERENCES record(id_record)
);

-- Tabla de facturas
CREATE TABLE invoice(
    id_invoice int(11) NOT NULL AUTO_INCREMENT,
    id_sale int(11),
    invoice_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id_invoice),
    FOREIGN KEY(id_sale) REFERENCES sales(id_sale)
);

-- Tabla de direcciones de envío para clientes
CREATE TABLE shipping_address(
    id_address int(11) NOT NULL AUTO_INCREMENT,
    id_customer int(11),
    address_line1 varchar(255) NOT NULL,
    address_line2 varchar(255),
    city varchar(100) NOT NULL,
    state varchar(100),
    postal_code varchar(20),
    country varchar(100),
    PRIMARY KEY(id_address),
    FOREIGN KEY(id_customer) REFERENCES customer(id_customer)
);

-- Tabla de bitácora para ventas (log)
CREATE TABLE sales_log(
    id_log int(11) NOT NULL AUTO_INCREMENT,
    id_sale int(11),
    log_date DATETIME NOT NULL,
    log_action varchar(255) NOT NULL,
    PRIMARY KEY(id_log),
    FOREIGN KEY(id_sale) REFERENCES sales(id_sale)
);

-- Tabla de inventario
CREATE TABLE inventory(
    id_inventory int(11) NOT NULL AUTO_INCREMENT,
    id_record int(11),
    stock_quantity int(11) NOT NULL,
    stock_date DATETIME NOT NULL,
    PRIMARY KEY(id_inventory),
    FOREIGN KEY(id_record) REFERENCES record(id_record)
);

-- Tabla de proveedores
CREATE TABLE supplier(
    id_supplier int(11) NOT NULL AUTO_INCREMENT,
    supplier_name varchar(100) NOT NULL,
    contact_name varchar(100),
    phone varchar(20),
    email varchar(100),
    PRIMARY KEY(id_supplier)
);

-- Tabla de compras a proveedores
CREATE TABLE supplier_order(
    id_order int(11) NOT NULL AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    id_supplier int(11),
    total_cost DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id_order),
    FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier)
);

-- Detalle de las compras a proveedores
CREATE TABLE supplier_order_detail(
    id_order_detail int(11) NOT NULL AUTO_INCREMENT,
    id_order int(11),
    id_record int(11),
    quantity int(11) NOT NULL,
    cost_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY(id_order_detail),
    FOREIGN KEY(id_order) REFERENCES supplier_order(id_order),
    FOREIGN KEY(id_record) REFERENCES record(id_record)
);
