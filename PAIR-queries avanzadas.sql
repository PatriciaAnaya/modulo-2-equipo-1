USE northwind;

/*Productos más baratos y caros de nuestra la bases de datos*/
SELECT MIN(UnitPrice) AS LowestPrice, MAX(UnitPrice) AS HightestPrice
FROM products;

/*Conociendo el numero de productos y su precio medio*/
SELECT count(*) AS cantidad, AVG(UnitPrice) as precio_medio, products
FROM products;

/*Sacad la máxima y mínima carga de los pedidos de UK*/
SELECT MIN(freight) AS minima_carga, MAX(freight) AS maxima_carga
FROM orders
WHERE ShipCountry = "UK";

/*Qué productos se venden por encima del precio medio*/
SELECT productname, unitprice
FROM products
WHERE UnitPrice > (SELECT AVG(UnitPrice) FROM products)
ORDER BY UnitPrice DESC;

/*Qué productos se han descontinuado*/
SELECT COUNT(*)
FROM products
WHERE discontinued != 0;

/*Detalles de los productos de la query anterior*/
SELECT ProductID, ProductName
FROM products
WHERE discontinued = 0
ORDER BY ProductId desc 
LIMIT 10;

/*Relación entre número de pedidos y máxima carga*/
SELECT COUNT(orderID) AS cantidad_pedidos, max(freight), EmployeeID
FROM orders
GROUP BY EmployeeID;

/*Descartar pedidos sin fecha y ordenarlos*/
SELECT COUNT(orderID) AS cantidad_pedidos, max(freight), EmployeeID
FROM orders
WHERE ShippedDate IS NOT NULL
GROUP BY EmployeeID
ORDER BY EmployeeID;
