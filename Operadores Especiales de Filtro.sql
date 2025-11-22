-- Ciudades que empiezan con "A" o "B".
SELECT City, CompanyName, ContactName
FROM customers
WHERE city REGEXP "^[AB]";

-- Número de pedidos que han hecho en las ciudades que empiezan con L.
SELECT c.City AS City, c.CompanyName as CompanyName, c.ContactName as ContactName, COUNT(o.orderID) as Orders
FROM customers c
INNER JOIN orders o
ON o.CustomerID = c.CustomerID
WHERE city LIKE "L%"
GROUP BY City, CompanyName, ContactName;

-- Todos los clientes cuyo "country" no incluya "Sales".
SELECT ContactName, ContactTitle, CompanyName
FROM customers
WHERE ContactTitle NOT LIKE "%Sales%";

-- Todos los clientes que no tengan una "A" en segunda posición en su nombre.
SELECT ContactName
FROM customers
WHERE ContactName NOT LIKE "_A%";

-- Extraer toda la información sobre las compañías que tengamos en la bases de datos
SELECT City, CompanyName, ContactName, "Customers" as relationship
FROM customers
UNION
SELECT City, CompanyName, ContactName, "Suppliers" as relationship
FROM suppliers;

-- Extraer todas las categorías de la tabla categories que contengan en la descripción "sweet" o "Sweet".
SELECT CategoryName
FROM categories
WHERE Description LIKE "%sweet%";

-- Extraed todos los nombres y apellidos de los clientes y empleados que tenemos en la bases de datos:
SELECT ContactName
FROM customers
UNION
SELECT CONCAT(FirstName," ",LastName)
FROM employees; 