USE northwind;
-- EJERCICIO 1
SELECT c.customerID , c.companyname, COUNT(o.orderID) AS Num_Pedidos
FROM customers c
JOIN orders o ON c.customerid=o.customerid
WHERE c.country='UK'
GROUP BY c.customerID, c.companyname
ORDER BY Num_Pedidos DESC;
-- EJERCICIO 2
SELECT c.companyname as Nombre_Empresa, SUM(od.Quantity) as NUM_OBJT, YEAR(o.orderdate)
FROM orders o
INNER JOIN customers c ON o.customerid=c.customerID
INNER JOIN orderdetails od ON o.orderID=od.orderID
WHERE c.country='UK'
GROUP BY c.companyname,YEAR(o.orderdate);
-- EJERCICIO 3
SELECT o.orderID,c.companyname AS CompanyName ,o.orderDate
FROM orders o
INNER JOIN customers c ON c.customerId=o.customerID;
-- EJERCICIO 4
SELECT c.categoryID,c.categoryname,p.productname, SUM(od.unitprice*od.quantity) AS ProductSales
FROM products p
INNER JOIN categories c ON c.categoryID=p.categoryID
INNER JOIN orderdetails od ON p.productID=od.productID
GROUP BY categoryname,categoryID, productname;
-- EJERCICIO 5
SELECT c.companyname,o.orderID, o.orderdate
FROM customers c
INNER JOIN orders o ON c.customerID=o.customerID;
-- EJERCICIO 6
SELECT c.companyname,SUM(o.orderID) AS NumeroPedidos
FROM customers c
INNER JOIN orders o ON c.customerID=o.customerID
GROUP BY companyname;
-- EJERCICIO 7
SELECT territoryID, employeeID
FROM employees
CROSS JOIN Territories;