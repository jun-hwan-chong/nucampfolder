-- create the database
DROP DATABASE IF EXISTS week1_workshop;
CREATE DATABASE week1_workshop;
-- connect via psql
\c week1_workshop

-- database configuration
SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET default_tablespace = '';
SET default_with_oids = false;


---
--- CREATE tables
---

CREATE TABLE products (
    product_id SERIAL,
    product_name TEXT NOT NULL,
    discontinued INT NOT NULL,
    supplier_id INT,
    category_id INT,
    PRIMARY KEY(product_id)
);


CREATE TABLE categories (
    category_id SERIAL,
    category_name TEXT NOT NULL,
    category_description TEXT,
    picture TEXT,
    PRIMARY KEY(category_id)
);

-- TODO create more tables here...
CREATE TABLE supplier (
    supplier_id SERIAL,
    supplier_name TEXT NOT NULL,
    PRIMARY KEY(supplier_id)
);

CREATE TABLE orders (
    order_id SERIAL,
    order_date TIMESTAMP,
    PRIMARY KEY(order_id),
    customer_id INT,
    employee_id INT,
    shipper_id INT
);

CREATE TABLE product_orders (
    product_id INT NOT NULL,
    order_id INT NOT NULL,
    PRIMARY KEY(product_id, order_id),
    quantity INT NOT NULL,
    discount FLOAT NOT NULL
);

CREATE TABLE customer (
    customer_id SERIAL,
    customer_companyname TEXT NOT NULL,
    PRIMARY KEY(customer_id)
);

CREATE TABLE shipper (
    shipper_id SERIAL,
    shipper_name TEXT NOT NULL,
    shipper_phone TEXT,
    PRIMARY KEY(shipper_id)
);

CREATE TABLE employee (
    employee_id SERIAL,
    employee_firstname TEXT NOT NULL,
    employee_lastname TEXT NOT NULL,
    PRIMARY KEY(employee_id),
    manager_id INT
);

CREATE TABLE employee_territory (
    employee_id INT NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY(employee_id, territory_id)
);

CREATE TABLE territory (
    territory_id SERIAL,
    territory_description TEXT NOT NULL,
    PRIMARY KEY(territory_id),
    region_id INT NOT NULL
);

CREATE TABLE region (
    region_id SERIAL,
    region_description TEXT NOT NULL,
    PRIMARY KEY(region_id)
);

CREATE TABLE us_state (
    us_state_id SERIAL,
    us_state_name TEXT,
    us_state_abbreviation CHAR(2) NOT NULL,
    PRIMARY KEY(us_state_id)
);
---
--- Add foreign key constraints
---

ALTER TABLE products
ADD CONSTRAINT fk_products_categories 
FOREIGN KEY (category_id) 
REFERENCES categories;

-- TODO create more constraints here...

ALTER TABLE products
ADD CONSTRAINT fk_products_suppliers
FOREIGN KEY (supplier_id)
REFERENCES supplier;

ALTER TABLE product_orders
ADD CONSTRAINT fk_products_orders_products
FOREIGN KEY (product_id)
REFERENCES products;

ALTER TABLE product_orders
ADD CONSTRAINT fk_products_orders_orders
FOREIGN KEY (order_id)
REFERENCES orders;

ALTER TABLE orders
ADD CONSTRAINT fk_order_customer
FOREIGN KEY (customer_id)
REFERENCES customer;

ALTER TABLE orders
ADD CONSTRAINT fk_order_shipper
FOREIGN KEY (shipper_id)
REFERENCES shipper;

ALTER TABLE orders
ADD CONSTRAINT fk_order_employee
FOREIGN KEY (employee_id)
REFERENCES employee;

ALTER TABLE territory
ADD CONSTRAINT fk_territory_region
FOREIGN KEY (region_id)
REFERENCES region;

ALTER TABLE employee_territory
ADD CONSTRAINT fk_employee_territory_employee
FOREIGN KEY (employee_id)
REFERENCES employee;

ALTER TABLE employee_territory
ADD CONSTRAINT fk_employee_territory_territory
FOREIGN KEY (territory_id)
REFERENCES employee;

ALTER TABLE employee
ADD CONSTRAINT fk_employees_manager
FOREIGN KEY (manager_id)
REFERENCES employee;