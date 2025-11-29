-- Todos los clientes de la tabla

SELECT *
FROM clientes;

SELECT nombre,pais
FROM clientes;

SELECT nombre,pais
FROM clientes
LIMIT 3;

SELECT nombre,pais
FROM clientes
WHERE pais='España'
LIMIT 3;

SELECT nombre,id_cliente
FROM clientes
WHERE fecha_registro>'2024-04-01';

SELECT nombre,id_cliente,pais
FROM clientes
WHERE pais is NULL;

-- ORDENAR RESULTADOS

-- obtener los productos cuyo precio sea mayor que 30

SELECT *
FROM productos
WHERE precio>30;

-- Ordenados por precio

SELECT *
FROM productos
WHERE precio>30
order by precio;

-- Ordenar por precio y categoria

SELECt *
FROM productos
Order by categoria asc, precio desc;

-- IN/NOT IN filtrar valores en lista
SELECT *
FROM productos
WHERE categoria in ('Ropa','Hogar');

SELECT *
FROM productos
WHERE categoria= 'Ropa' or categoria='Hogar';

SELECT *
FROM productos
WHERE categoria not in ('Ropa','Hogar');

-- between y el limit/offset

SELECT *
FROM productos
where precio between 20 and 100 
ORDER by precio;

-- LIMIT/OFFSET
SELECT *
FROM productos
LIMIT 5 OFFSET 3; 

-- distinct/alias
SELECT  distinct pais AS pais_residencia
from clientes
WHERE pais is not null;

-- PEDIDOS de mas de una unidad
SELECT cantidad
FROM PEDIDOS
WHERE cantidad>1
ORDER BY cantidad;

-- clientes que empiecen por A o L

SELECT *
FROM clientes
WHERE nombre LIKE 'A%' or nombre LIKE 'L%';

-- ULTIMOS 3 PEDIDOS

SELECT *
FROM pedidos
order by fecha_pedido desc
LIMIT 3;

