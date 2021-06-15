--1. Get all customers and their addresses.
SELECT "customers", "addresses" FROM "customers"
JOIN "addresses" ON "customers".id = "addresses".customer_id;

--2. Get all orders and their line items (orders, quantity and product).
SELECT "orders", "line_items".order_id, "line_items".quantity, "products".description FROM "orders"
JOIN "line_items" ON "orders".id = "line_items".order_id
JOIN "products" ON "products".id = "line_items".product_id;

--3. Which warehouses have cheetos?
SELECT "warehouse".warehouse, "products".description FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".id = 5;

--4. Which warehouses have diet pepsi?
SELECT "warehouse".warehouse, "products".description FROM "warehouse_product"
JOIN "products" ON "products".id = "warehouse_product".product_id
JOIN "warehouse" ON "warehouse".id = "warehouse_product".warehouse_id
WHERE "products".id = 6;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers", count("orders") FROM "addresses"
JOIN "customers" ON "customers".id = "addresses".customer_id
JOIN "orders" ON "orders".id = "addresses".id
GROUP BY "customers";

--6. How many customers do we have?
SELECT count(*) AS Total_Customers FROM "customers";

--7. How many products do we carry?
SELECT count(*) AS SKUs FROM "products"

--8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM("warehouse_product".on_hand) AS Diet_Pepsi FROM "warehouse" 
JOIN "warehouse_product" ON "warehouse_product".warehouse_id = "warehouse".id
JOIN "products" ON "products".id = "warehouse_product".product_id
 WHERE "products".id = 6;
