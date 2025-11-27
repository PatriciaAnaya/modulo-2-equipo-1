-- Extraed los pedidos con el máximo "order_date" para cada empleado.
SELECT o1.OrderID, o1.CustomerID, o1.EmployeeID, o1.OrderDate, o1.RequiredDate
FROM orders o1
WHERE OrderDate = (
	SELECT MAX(o2.OrderDate) as OrderDate
    FROM orders o2
    WHERE o2.EmployeeID =  o1.EmployeeID
    );

-- Extraed información de los productos "Beverages"
SELECT p.ProductID, p.ProductName, c.CategoryID
FROM products p
INNER JOIN categories c
ON c.categoryID = p.CategoryID
WHERE c.CategoryName = "Beverages";
    
SELECT ProductID, ProductName, CategoryID
FROM Products
WHERE CategoryID IN (
        SELECT CategoryID
        FROM Categories
        WHERE CategoryName = 'Beverages'
    );

-- Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país
SELECT DISTINCT(Country)
FROM Customers
WHERE COUNTRY NOT IN (
	SELECT Country
    FROM suppliers
    );
    
-- Extraer los clientes que compraron mas de 20 artículos "Grandma's Boysenberry Spread"

-- en construccion
SELECT OrderID, CustomerID
FROM orders
WHERE CustomerID in (
	SELECT customerID
    FROM orderdetails
	WHERE productID = 6 AND Quantity >20);
    
    
    
    