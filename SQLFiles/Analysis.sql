USE storeData;

-- Analysis 1 : Which products to order more of?
-- Calculating product ordered to in-stock ratio

-- Selecting desired columns from required tables
SELECT productCode, SUM(quantityOrdered) AS QuantityOrdered FROM ORDERDETAILS GROUP BY productCode ORDER BY productCode;

SELECT quantityInStock, productCode FROM PRODUCTS;

-- Joining the two tables
SELECT OD.productCode, SUM(OD.quantityOrdered) AS QuantityOrdered, P.quantityInStock
FROM ORDERDETAILS OD
INNER JOIN PRODUCTS P ON OD.productCode = P.productCode
GROUP BY OD.productCode
ORDER BY P.productCode;

-- Query to calculate in-stock ration after joining tables and Printing the 10 records with highest ration
-- Priority products for restocking are those with high product performance that are on the brink of being 
-- out of stock
SELECT P.productName, OD.QuantityOrdered, P.quantityInStock, ROUND(OD.QuantityOrdered/P.quantityInStock, 2) 
AS inStockRatio FROM
(SELECT quantityInStock, productCode, productName FROM PRODUCTS) P
INNER JOIN
(SELECT productCode, SUM(quantityOrdered) AS QuantityOrdered FROM ORDERDETAILS GROUP BY productCode) OD
ON OD.PRODUCTCODE = P.PRODUCTCODE
ORDER BY inStockRatio DESC
LIMIT 10;


-- Analysis 2: How to Match Marketing and Communication Strategies to Customer Behavior
-- First step can be to categorize customers according to the profit store earns from them. Different campaigns
-- can be organised for different customer groups on the base of profit cut.alter

-- Calculating total profit earned by each customer
SELECT CUSTOMERNUMBER, SUM((PRICEEACH -BUYPRICE)* QUANTITYORDERED) AS PROFIT
FROM ORDERS AS O
JOIN
(SELECT OD.ORDERNUMBER, OD.PRICEEACH, OD.QUANTITYORDERED, P.BUYPRICE
FROM ORDERDETAILS AS OD
JOIN
PRODUCTS AS P) T2
ON O.ORDERNUMBER = T2.ORDERNUMBER
GROUP BY O.CUSTOMERNUMBER
ORDER BY PROFIT DESC;

SELECT CUSTOMERNUMBER, SUM((PRICEEACH - BUYPRICE)* QUANTITYORDERED) AS PROFIT
FROM ORDERS AS O
JOIN
ORDERDETAILS AS OD
ON O.ORDERNUMBER = OD.ORDERNUMBER
JOIN
PRODUCTS AS P
ON OD.PRODUCTCODE = P.PRODUCTCODE
GROUP BY O.CUSTOMERNUMBER
ORDER BY PROFIT DESC;

-- Finding the top five VIP customers.
SELECT C.CUSTOMERNUMBER, contactLastName, contactFirstName, city, country, 
SUM((PRICEEACH - BUYPRICE)* QUANTITYORDERED) AS PROFIT
FROM CUSTOMERS AS C
JOIN 
ORDERS AS O
ON C.CUSTOMERNUMBER = O.CUSTOMERNUMBER
JOIN
ORDERDETAILS AS OD
ON O.ORDERNUMBER = OD.ORDERNUMBER
JOIN
PRODUCTS AS P
ON OD.PRODUCTCODE = P.PRODUCTCODE
GROUP BY O.CUSTOMERNUMBER
ORDER BY PROFIT DESC
LIMIT 5;

-- Analysis 3
-- To determine how much money we can spend acquiring new customers, we can compute the Customer Lifetime Value (LTV), 
-- which represents the average amount of money a customer generates. 
-- We can then determine how much we can spend on marketing.

WITH CUSTOMER_PROFIT AS
(SELECT C.CUSTOMERNUMBER, contactLastName, contactFirstName, city, country, 
SUM((PRICEEACH - BUYPRICE)* QUANTITYORDERED) AS PROFIT
FROM CUSTOMERS AS C
JOIN 
ORDERS AS O
ON C.CUSTOMERNUMBER = O.CUSTOMERNUMBER
JOIN
ORDERDETAILS AS OD
ON O.ORDERNUMBER = OD.ORDERNUMBER
JOIN
PRODUCTS AS P
ON OD.PRODUCTCODE = P.PRODUCTCODE
GROUP BY O.CUSTOMERNUMBER)

SELECT AVG(CP.PROFIT)
FROM CUSTOMER_PROFIT AS CP;
