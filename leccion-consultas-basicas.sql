CREATE DATABASE IF NOT EXISTS tienda_prueba;
USE tienda_prueba;

-- Tabla de clientes
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50),
    pais VARCHAR(30),
    correo VARCHAR(100) UNIQUE,
    fecha_registro DATE
);

-- Insertamos algunos datos
INSERT INTO clientes (nombre, apellido, pais, correo, fecha_registro)
VALUES
('Ana', 'Martínez', 'España', 'ana.martinez@email.com', '2024-03-01'),
('Luis', 'Pérez', 'México', 'luis.perez@email.com', '2024-04-10'),
('Carla', 'Gómez', 'Chile', 'carla.gomez@email.com', '2024-02-20'),
('Pedro', 'López', 'Argentina', 'pedro.lopez@email.com', '2024-01-15'),
('Sara', 'Jiménez', 'España', 'sara.jimenez@email.com', '2024-04-25'),
('Lucía', 'Torres', NULL, 'lucia.torres@email.com', '2024-05-02');


-- Tabla de productos
CREATE TABLE productos (
    id_producto INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    categoria ENUM('Electrónica', 'Ropa', 'Hogar', 'Juguetes'),
    precio DECIMAL(6,2),
    stock INT
);

INSERT INTO productos (nombre, categoria, precio, stock)
VALUES
('Auriculares', 'Electrónica', 25.99, 100),
('Televisor', 'Electrónica', 350.00, 20),
('Camiseta', 'Ropa', 15.50, 200),
('Sartén', 'Hogar', 22.00, 80),
('Robot aspirador', 'Hogar', 180.00, 15),
('Muñeca', 'Juguetes', 12.99, 50),
('Coche teledirigido', 'Juguetes', 35.00, 30),
('Sudadera', 'Ropa', 29.99, 120);


-- Tabla de pedidos
CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_producto INT,
    cantidad INT,
    fecha_pedido DATE,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto)
);

INSERT INTO pedidos (id_cliente, id_producto, cantidad, fecha_pedido)
VALUES
(1, 1, 2, '2024-05-10'),
(1, 4, 1, '2024-05-15'),
(2, 2, 1, '2024-05-20'),
(3, 3, 3, '2024-05-18'),
(4, 5, 1, '2024-06-02'),
(5, 6, 2, '2024-06-03'),
(6, 7, 1, '2024-06-05');




-- todos los clientes de la base de datos
SELECT *
FROM clientes;

-- todos los clientes de columnas específicas
SELECT nombre, pais
FROM clientes;

-- 3 primeros clientes de ambas columna
SELECT nombre, pais
FROM clientes
WHERE pais = "España"
LIMIT 3; /*para limitar la cantidad en el orden que lo encuentra. Cantidad, no índice*/

-- clientes a partir de una fecha
SELECT nombre, id_cliente
FROM clientes
WHERE fecha_registro > '2024-04-01';

-- clientes con pais nulo
SELECT nombre, id_cliente, pais
FROM clientes
WHERE pais IS NULL;

-- ordenar resultados: ORDER BY.
-- productos con precio >30€.
SELECT *
FROM productos
WHERE precio > 30;

-- ordenados por precio. ASC ascendente, DESC descendente.
SELECT *
FROM productos
WHERE precio > 30
ORDER BY precio; /*por defecto lo hace ascendente.*/

-- ordenar por precio y categoría
SELECT *
FROM productos
ORDER BY categoria ASC, precio DESC;
/*en este caso, al categoria ser tipo ENUM, lo ordenaría según el orden indicado en la columna */ 

-- in / not in
SELECT * FROM productos
where categoria in ('ropa', 'hogar');
/*lo mismo que poner "where categoria = 'Ropa' or categoria = 'Hogar'*/ 

SELECT * FROM productos
where categoria NOT IN ('ropa', 'hogar');
/*lo mismo que poner "where categoria != 'Ropa' or categoria != 'Hogar'*/ 

-- between
SELECT * FROM productos
WHERE precio BETWEEN 20 AND 100
ORDER BY precio;

SELECT * FROM productos
WHERE precio >20 AND precio <100
ORDER BY precio;

-- limit/offset (donde quiero empezar a contar. Empieza al siguiente de lo que indicamos.)
SELECT * FROM productos
limit 5 offset 3;

-- distinct  / alias
SELECT DISTINCT pais FROM clientes /*trae resultados sin repetir*/
WHERE pais IS NOT NULL;

SELECT DISTINCT pais, apellido FROM clientes /*en este caso España está repetido pero lo muestra porque Martinez no está repetido*/
WHERE pais IS NOT NULL;

SELECT DISTINCT pais as pais_residencia, apellido /*le pone un alias a la visualización. no modifica los datos de la tabla.*/
FROM clientes
WHERE pais IS NOT NULL;

-- Clientes que empiece por A o por L
SELECT * FROM clientes
where nombre LIKE 'A%' OR nombre LIKE 'L%';

-- Ultimos tres pedidos realizados
SELECT * FROM pedidos
ORDER BY fecha_pedido DESC
LIMIT 3;