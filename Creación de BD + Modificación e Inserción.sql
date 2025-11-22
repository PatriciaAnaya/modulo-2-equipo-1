use tienda_zapatillas;
CREATE TABLE zapatillas(
id_zapatilla INT NOT NULL AUTO_INCREMENT,
PRIMARY KEY (id_zapatilla),
modelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL
);

CREATE TABLE clientes(
id_cliente INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45) NOT NULL,
numero_telefono INT NOT NULL,
email VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL,
ciudad VARCHAR(45) NOT NULL,
provincia VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
codigo_postal VARCHAR(45) NOT NULL
);

CREATE TABLE empleados(
id_empleado INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL
);

CREATE TABLE facturas(
id_factura INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
numero_factura VARCHAR(45) NOT NULL,
fecha DATE NOT NULL,
zapatilla INT NOT NULL,
empleado INT NOT NULL,
cliente INT NOT NULL,

FOREIGN KEY (zapatilla)
	REFERENCES zapatillas(id_zapatilla),
    
FOREIGN KEY (empleado)
	REFERENCES empleados(id_empleado),
    
FOREIGN KEY (cliente)
	REFERENCES clientes(id_cliente)
);


/*El codigo correcto es: 

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT,
nombre VARCHAR(100),
email VARCHAR(50) UNIQUE,
fecha_registro DATE DEFAULT (CURRENT_DATE()),
edad INT CHECK (edad > 18),
saldo DECIMAL(10,2) DEFAULT 0,
PRIMARY KEY (id_cliente)
);
*/