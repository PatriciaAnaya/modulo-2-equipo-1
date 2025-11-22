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

--ejercicio resuelto
SELECT AVG(UnitPrice) as Precio_Medio  
FROM products;

SELECT DISTINCT ProductName, UnitPrice  
FROM products 
WHERE UnitPrice > (28.86)  
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


-- BONUS
/*Números de pedidos por día*/
SELECT year(OrderDate) as AÑO, month(OrderDate) as MES, day(OrderDate) as DIA, count(orderID)
FROM orders
GROUP BY AÑO, MES, DIA
ORDER BY AÑO, MES, DIA;
-- corregido
SELECT COUNT(*) AS OrderCount, DAY(OrderDate) AS OrderDay, MONTH(OrderDate) AS OrderMonth, YEAR(OrderDate) AS OrderYear  
FROM orders 
GROUP BY OrderDate  
ORDER BY OrderDate;  

/*Número de pedidos por mes y año*/
SELECT year(OrderDate) as AÑO, month(OrderDate) as MES, count(orderID) AS PEDIDOS
FROM orders
GROUP BY AÑO, MES
ORDER BY AÑO, MES;
-- corregido
SELECT COUNT(*) AS OrderCount, MONTH(OrderDate) AS OrderMonth, YEAR(OrderDate) AS OrderYear  
FROM orders  
GROUP BY  OrderDate  
ORDER BY OrderDate;

/*lecciona las ciudades con 4 o más empleadas*/
SELECT City, COUNT(*) AS empleadas
FROM employees
GROUP BY City
HAVING empleadas >= 4;

/*Crea una nueva columna basándonos en la cantidad monetaria*/
SELECT OrderID, SUM(UnitPrice * Quantity) AS CostoTotalPedido,
CASE
	WHEN SUM(UnitPrice * Quantity) >= 2000 THEN 'Alto'
	ELSE 'Bajo'
END AS TipoPedido
FROM orderdetails
GROUP BY OrderID
ORDER BY OrderID;

















