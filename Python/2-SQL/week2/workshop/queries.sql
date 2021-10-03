-- Part 1: Warm Up

-- Select all rows and all columns from the categories table; order by category ID.
select * from categories
order by category_id;

-- Select name and description of each category; order by ID.
select category_name, description from categories
order by category_id;

-- Select all values in the "city" column of the employees table; sort values descending order.
select city from employees
order by city desc;

-- Select a unique set of employees' city names in descending order.
select distinct city from employees
order by city desc;

-- Select ID and name of all discontinued products; order by name.
select product_id, product_name from products
where discontinued=1
order by product_name;


-- Part 2: Orders

-- Select the date of each customer's first order and its corresponding customer ID; sort by customer ID.
select min(order_date), customer_id from orders
group by customer_id order by customer_id;

-- Same as previous query, but name the column of date values "first_order_date".
select min(order_date) as first_order_date, customer_id from orders
group by customer_id order by customer_id;

-- Same as previous query, but sort by first_order_date instead of customer ID.
select min(order_date) as first_order_date, customer_id from orders
group by customer_id order by first_order_date;

-- How many orders have been placed?
select count(*) from orders;

-- How many orders has each customer made? List customer-ID, order-count pairs; sort by order-count (greatest to least).
select customer_id, count(order_id) as order_count from orders
group by customer_id order by order_count;

-- What is the average cost of freight per order?
select avg(freight) from orders;

-- For each customer, list customer ID and the average freight cost of their orders; sort by average freight cost.
select customer_id, avg(freight) as average_order from orders
group by customer_id order by average_order;

-- For each customer, list customer ID and the total amount they have spent on freight; sort by cusotmer ID.
select customer_id, sum(freight) from orders
group by customer_id order by customer_id;

-- Select the address and the order-count for the address that has received the most orders.
select ship_address, count(ship_address) as address_count from orders
group by ship_address order by address_count desc limit 1;

-- Order Subtotal: unit_price * quantity * (1 - discount)
-- Order Total: sum of order's subtotals
-- Given the definitions above, get the Order ID and Order Total for the 50 most expensive orders; sort by Order Total in descending order.
SELECT order_id, SUM(unit_price * quantity * (1 - discount)) AS total FROM order_details GROUP BY order_id ORDER BY total DESC LIMIT 50;


-- Part 3: Employees

-- What are first and last name of each Sales Representative? Order by last name.
select first_name, last_name from employees
where title = 'Sales Representative' order by last_name;

-- Get first name, last name, and notes for employees who don't have anyone to report to (i.e. their reports_to field is blank). Order by last name.
select first_name, last_name, notes from employees
where reports_to is null order by last_name;

-- Get first name, last name, and notes for employees who do have someone to report to. Order by last name.
select first_name, last_name, notes from employees
where reports_to is not null order by last_name;

-- Get first name and last name of the first employee to be hired in London.
select first_name, last_name, hire_date from employees
where city = 'London' 
order by hire_date 
limit 1;

-- Get first name and home phone of employees whose first names begin with the letter 'A' and whose phone numbers contain the number '4'. Sort by last name.
select first_name, home_phone from employees
where first_name like 'A%' and home_phone like '%4%' order by last_name;


-- Get city name and number of Sales Representatives in each city that contains at least 2 Sales Reps. Order by the number of Sales Reps.
select city, count(*) from employees
where title = 'Sales Representative' 
group by city 
having count(*) > 1 
order by count(*);


-- Get first names, last names, and hire dates of employees who were hired in 1994; sort by hire date.
SELECT first_name, last_name, hire_date FROM employees 
WHERE EXTRACT(year FROM hire_date) = 1994 ORDER BY hire_date;



-- Part 4: Mix and Match

-- List product names that begin with the letter 'C' and their corresponding category names. Order by product ID.
select products.product_name, categories.category_name
from products
join categories
on products.category_id = categories.category_id
where products.product_name like 'C%'
order by products.product_id;


-- Management wants a "call list" to check on customers who haven't ordered in a while.
-- List contact names, contact titles, company names, phone numbers, and last order dates for no more than 10 customers; sort by last order date (least recent first).
select c.contact_name, c.contact_title, c.company_name, c.phone, o.order_date
from customers c
join orders o
on c.customer_id = o.customer_id
order by o.order_date desc
limit 10;

-- Management needs to know which products to order due to low stock levels.
-- Each product has an Item Deficit which is defined as the difference between its reorder_level and units_in_stock
-- A product should be ordered if it meets the following criteria:
--   1. The number of units in stock is less than or equal to its reorder-level
--   2. The product is not discontinued
--   3. The number of units on order is less than the product's Item Deficit
-- List product names, supplier company names, supplier phone numbers, and item deficits for each product that should be ordered. Sort by item deficits (greatest to least).
select p.product_name, s.company_name, s.phone, p.reorder_level - p.units_in_stock as item_deficit
from products p
join suppliers s
on p.supplier_id = s.supplier_id
where p.units_in_stock <= p.reorder_level and p.discontinued = 0 and p.units_on_order < (p.reorder_level - p.units_in_stock)
order by item_deficit desc;

-- List company names of suppliers who have not shipped any orders; sort alphabetically.
select s.company_name from suppliers s
where s.supplier_id not in (select ship_via from orders)
order by s.company_name;

-- List region description, territory description, employee last name, and employees first name for each territory and region an employee works in.
-- Remove duplicate results and sort first by region description, then territory description, then last name, and finally first name.
SELECT DISTINCT r.region_description, t.territory_description, e.last_name, e.first_name FROM employees e
JOIN employee_territories et ON e.employee_id = et.employee_id
JOIN territories t on et.territory_id = t.territory_id
JOIN region r ON t.region_id = r.region_id
ORDER BY r.region_description, t.territory_description, e.last_name, e.first_name;

-- Get ALL U.S. state names and abbreviations, along with customer company names for customers based in the USA.
-- If a state does not have any relate customers, fill in NULL for the company_name field. Order by state name. 
SELECT s.state_name, s.state_abbr, c.company_name
FROM us_states s
LEFT JOIN customers c 
ON s.state_abbr=c.region AND c.country='USA'
ORDER BY state_name;

-- List territory ID, employee title of courtesy, and employee last name for all employees in all territories.
-- If a territory has no employees assigned, list its ID with NULL filled in for the relevant employee fields. Sort by territory ID.
SELECT t.territory_id, e.title_of_courtesy, e.last_name 
FROM territories t 
LEFT JOIN employee_territories et ON t.territory_id = et.territory_id 
LEFT JOIN employees e ON et.employee_id = e.employee_id 
ORDER BY t.territory_id;

-- For each order, list the order ID and the number of unique products in said order (call this product_count). 
-- Filter to only include orders with at least 5 unique products. Sort by product_count in descending order.
SELECT o.order_id, count(*) AS product_count 
FROM order_details o 
JOIN products p ON o.product_id = p.product_id 
GROUP BY order_id HAVING(count(*)) >= 5 
ORDER BY product_count DESC;

-- Management needs a list of all suppliers and customers for their holiday greetings card!
-- Provide a list with the company name, address, city, region, postal code, and country for all suppliers and customers.
-- Sort by company name.
SELECT * FROM (
	SELECT company_name, address, city, region, postal_code, country FROM customers
	UNION
	SELECT company_name, address, city, region, postal_code, country FROM suppliers
) AS entries
ORDER BY entries.company_name;