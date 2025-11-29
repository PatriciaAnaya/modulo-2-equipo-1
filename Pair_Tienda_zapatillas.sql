
CREATE TABLE Zapatillas(
	id_zapatillas INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) NOT NULL
);

CREATE TABLE Clientes (
	id_cliente INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR (45) NOT NULL,
    numero_telefono INT NOT NULL,
    email VARCHAR(45) NOT NULL,
    direccion  VARCHAR(45) NOT NULL,
    ciudad  VARCHAR(45) NOT NULL,
    provincia  VARCHAR(45) NOT NULL,
    pais  VARCHAR(45) NOT NULL,
    codigo_postal  VARCHAR(45) NOT NULL
    
);

CREATE TABLE empleados(
	id_empleado INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR (45) NOT NULL,
	tienda VARCHAR (45) NOT NULL,
	salario INT,
    fecha_incorporacion DATE NOT NULL

);

CREATE TAbLE facturas(

	id_facturas INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    numero_factura VARCHAR (45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatillas INT  NOT NULL,
    id_empleado INT NOT NULL,
    id_cliente INT NOT NULL,
	FOREIGN KEY (id_zapatillas) REFERENCES zapatillas(id_zapatillas),
    FOREIGN KEY (id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY (id_cliente) REFERENCES clientes (id_cliente)
    ON DELETE CASCADE
);

