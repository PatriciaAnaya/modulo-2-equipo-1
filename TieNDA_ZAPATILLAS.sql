CREATE SCHEMA mi_ejercicio;
use mi_ejercicio;
CREATE TABLE Empleadas(
	id_empleada INT auto_increment NOT NULL PRIMARY KEY,
    salario INT NOT NULL,
    nombre varchar(45),
    apellido varchar(45),
    pais varchar(45)
);

CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT CHECK(edad>16),
    ciudad varchar(255) DEFAULT 'Madrid'
);

CREATE TABLE empleadas_en_proyectos (
	id_empleada INT NOT NULL ,
	id_proyecto INT NOT NULL ,
    PRIMARY KEY (id_empleada, id_proyecto),
    FOREIGN KEY (id_empleada) REFERENCES Empleadas(id_empleada)
    ON DELETE CASCADE
);

