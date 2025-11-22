-- UNION permite unir 2 tablas eliminando filas duplicadas. Une el contenido, por lo que las tablas deben mirar la misma cantidad de columnas. 
select id_venta, fecha, cantidad
FROM ventas_2023
UNION
SELECT id, fecha, cantidad
FROM ventas_2024;

select id_venta, fecha, cantidad
FROM ventas_2023
UNION ALL /*une todo, incluso los duplicados*/
SELECT id, fecha, cantidad
FROM ventas_2024;

-- IN
SELECT *
FROM clientas
WHERE nombre IN ("Ana", "Mary", "Linda", "Cloe");

-- NOT IN
SELECT *
FROM clientas
WHERE nombre NOT IN ("Ana", "Mary", "Linda", "Cloe");

-- LIKE busca patrones en una cadena de texto. 
-- NOT LIKE excluye los registros que coinciden con el patrón
-- % representa cero o más caracteres de cualquier tipo. 
-- "_" representa solo 1 caracter.


-- Busca las clientas que cuyo apellido terine con "Son"
SELECT *
FROM clientas
WHERE apellido LIKE "%son";

-- Busca las clientas cuyo nombre empiece con "A"
SELECT *
FROM clientas
WHERE nombre LIKE "A%";

-- Busca las clientas cuya ciudad contenga una "I"
SELECT * 
FROM clientas
WHERE ciudad LIKE "%I%";
