-- Funciones agregadas

SELECT COUNT(*) AS total_alumnas -- select todo y llamalo total_alumnas. Si no se le da nombre, aparecerá como count(*)
FROM adalaber;

SELECT COUNT(DISTINCT curso) AS cursos -- hay que usar DISTINCT para que obvie los repetidos
from adalaber;

SELECT MIN(fecha_registro) AS primera_fecha_registro, MAX(fecha_registro) AS ultima_fecha_registro
-- selecciona el valor mínimo o el máximo y lo llama primera/ultima fecha registro. No se puede añadir por ejemplo "nommbre, MIN(fecha_registro)" ya que uno trae una lista y el otro trae un único valor.
FROM adalaber;


SELECT nombre, fecha_registro -- primera persona que se registró
FROM adalaber
order by fecha_registro desc
limit 1;

SELECT avg(edad) AS promedio_edad -- promedio edad
FROM adalaber;
SELECT round(AVG(edad)) AS promedio_edad -- promedio edad redondeando
FROM adalaber;

-- agrupar
SELECT round(AVG(edad)) AS promedio_edad, curso
FROM adalaber
GROUP BY curso;

-- alumnas por ciudad
SELECT COUNT(*) as cantidad, ciudad
from adalaber
GROUP BY ciudad; -- cada vez que se use GROUP BY se debe usar una funcion AGREGADA

-- dame la edad mínima por ciudad
SELECT min(edad) as edad_minima, ciudad
FROM adalaber
GROUP BY ciudad;

-- dame cantidad alumnas por ciudad donde tengamos la dirección
SELECT count(edad) as edad_minima, ciudad
FROM adalaber
WHERE direccion IS NOT NULL
GROUP BY ciudad;

-- cantidad de alumnas en cada curso
SELECT COUNT(*) as cantidad, curso
FROM adalaber
WHERE curso in ("Fullstack", "Data Science")
GROUP BY curso;

-- HAVING (similar a un where sobre el grupo que se acaba de crear)
SELECT COUNT(*) as cantidad, ciudad -- ciudad con más de 1 alumna
FROM adalaber
GROUP BY ciudad
HAVING cantidad > 1;

SELECT COUNT(*) AS cantidad, curso -- cursos con >2 alumnas
FROM adalaber
GROUP BY curso
HAVING cantidad > 2;

SELECT ciudad, COUNT(*) AS cantidad -- ciudades con >1 alumna que solo estén en los cursos back y data
FROM adalaber
WHERE curso IN ("Backend", "Data Science")
GROUP BY ciudad
HAVING cantidad >1;

-- CASE: crear categoría
SELECT nombre, conocimientos_previos, -- en este caso se añadiría coma en esta sentencia
CASE 
	WHEN conocimientos_previos = "Mucho" THEN "Nivel alto"
    WHEN conocimientos_previos = "Poco" THEN "Nivel medio"
    ELSE "nivel bajo"
END AS nivel_categoria
FROM adalaber
ORDER BY nivel_categoria;

-- añadir popularidad a las ciudades
SELECT ciudad, COUNT(*) AS total,
CASE
	WHEN count(*) = 1 THEN "Popularidad media"
    WHEN count(*) = 2 THEN "Popularidad alta"
    ELSE "popularidad baja"
END AS popularidad
FROM adalaber
GROUP BY ciudad;