CREATE SCHEMA adalab_bd;

USE adalab_bd;

CREATE TABLE adalaber(
	id_adalaber INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL, 
    email VARCHAR(100) UNIQUE,
    ciudad VARCHAR(30) DEFAULT "-",
    curso INT NOT NULL,
    conocimientos_previos ENUM("Sin", "Poco", "Mucho"), /*PARA ENUMERAR OPCIONES*/
    fecha_registro DATE NOT NULL,
    permiso_redes_sociales BOOL DEFAULT false,
);

-- INSERT

INSERT INTO adalaber(nombre, apellidos, email, curso, conocimientos_previos, fecha_registro, permiso_redes_sociales)
VALUES ("Patricia", "Anaya", "patrianaya@email.com", 59, "Sin", "2025/04/20", False);

INSERT INTO adalaber(nombre, apellidos, email, curso, conocimientos_previos, fecha_registro, permiso_redes_sociales)
VALUES 
("Amparo", "Martinez", "amparomartinez@email.com", 59, "Poco", "2025/11/15", True),
("Lucia", "Moreno", "lucimoreno@email.com", 59, "sin", "2025/09/30", False),
("Antonia", "Perez", "toniperez@email.com", 59, "Mucho", "2025/04/20", True),
("Ana", "Mas", "anamas@email.com", 59, "Poco", "2025/06/12", False),
("Julia", "Serrano", "juliaserrano@email.com", 59, "Sin", "2025/01/05", False);


-- CONSULTAS == QUERIES (QUERY)
/*qué quiero seleccionar */SELECT nombre, email
/*de qué tabla*/FROM adalaber;

SELECT *
FROM adalaber;

-- FILTROS
SELECT nombre, email, curso
FROM adalaber
/*qué condiciones debe coumplir*/ WHERE permiso_redes_sociales = True;

SELECT nombre, email, curso
FROM adalaber
WHERE conocimientos_previos = "sin" AND permiso_redes_sociales = False;

/*se puede usar AND u OR*/

SELECT nombre, email, curso
FROM adalaber
WHERE ciudad IS NULL;

-- UPDATE VALOR DE LA TABLA
UPDATE adalaber
SET conocimientos_previos = "Mucho"
WHERE email = "anamas@email.com";

-- ELIMINAR VALOR DE TABLA
DELETE FROM adalaber
WHERE nombre = "Ana";

-- ALTER TABLE: Modificar estructura de la base de datos
-- add columnn (añadir columna)
-- drop column (eliminar columna)
-- modify column 
-- change column (cambiar nombre columna)
ALTER TABLE adalaber MODIFY COLUMN permiso_redes_sociales BOOL NOT NULL DEFAULT false;

-- DROP TABLE
DROP TABLE IF EXISTS adalaber;