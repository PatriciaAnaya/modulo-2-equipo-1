USE northwind;

-- Empleadas que sean de la misma ciudad:
SELECT e.city as CiudadEmpleado, e.firstName as NombreEmpleado, e.LastName as ApellidoEmpleado, s.city as CiudadSupervisor, s.FirstName as NombreSupervisor, s.LastName as ApellidoSupervisor
FROM employees e
INNER JOIN employees s ON e.ReportsTo = s.EmployeeId
ORDER BY e.ReportsTo;

-- El equipo de marketing necesita una lista con todas las categorías de productos, incluso si no tienen productos asociados.
SELECT c.CategoryName, p.ProductName
FROM products p
RIGHT JOIN categories c ON p.CategoryId = c.CategoryID;

-- Desde el equipo de ventas nos piden obtener una lista de todos los pedidos junto con los datos de las empresas clientes.
SELECT o.OrderID, c.*
FROM orders o
LEFT JOIN customers c ON o.CustomerID = c.CustomerID;

-- El equipo de Recursos Humanos quiere saber qué empleadas han gestionado pedidos y cuáles no.
SELECT e.employeeID, CONCAT(e.firstname, " ", e.lastname) as Employee, COUNT(o.OrderID) as Orders
FROM employees e
RIGHT JOIN orders o ON e.EmployeeID = o.EmployeeID
group by employeeID;

-- Desde el área de logística nos piden una lista de todos los transportistas (shippers) y los pedidos que han enviado.
SELECT s.shipperID,s.companyname as Nombre_Transportista, o.orderID,o.orderdate
FROM shippers s
LEFT JOIN orders o ON s.shipperID=o.shipvia;