CREATE SCHEMA adalab_bd;
USE adalab_bd;

CREATE TABLE adalaber(
	id_adalaber	INT auto_increment PRIMARY KEY,
	nombre varchar(50) NOT NULL,
    apellidos varchar (50) NOT NULL,
    email varchar(50) UNIQUE,
	ciudad varchar (30) DEFAULT "Sin DAtos",
    direccion varchar(50),
    dni varchar(50) NOT NULL UNIQUE, 
    curso INT NOT NULL,
    conocimientos_previos ENUM('sin','poco','mucho'),
    permiso_rrss bool default false,
    fecha_registro date not null
);

-- INSERTAR

INSERT INTO adalaber(nombre, apellidos,email,ciudad,direccion,
			dni,curso,conocimientos_previos,permiso_rrss,fecha_registro)
VALUES('MariCarmen','Martinez','maricarmen@gmail.com','Madrid','camino Tolarieta','276285','59','sin',TRUE,'2025-08-30');

-- CONSULTAS== QUERIES
SELECT *
FROM adalaber;

-- FILTROS
SELECT nombre, email
FROM adalaber
WHERE ciudad="Barcelona";

-- UPDATE VALOR TABLA
UPDATE adalaber
SET conocimientos_previos='mucho'
WHERE id_adalaber='1';


-- ELIMINAR
DELETE FROM adalaber
WHERE id_adalaber='1'