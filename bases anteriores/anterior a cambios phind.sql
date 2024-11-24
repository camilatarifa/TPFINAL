-- antes de aplicar cambios sugeridos por phind:
CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50) NOT NULL,
    dni CHAR(8) NOT NULL,
    telefono VARCHAR(10)
/*    email VARCHAR(50),
    clave varchar(50)*/
);

CREATE TABLE productos(
    codigo INT PRIMARY KEY,
    id_producto INT PRIMARY KEY,
    tipo VARCHAR(50),
    producto varchar(50),
    precio double,
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    stock_maximo INT NOT NULL,
    PRIMARY KEY(codigo, id_producto),
    FOREIGN KEY (id_producto) REFERENCES sucursales(id_sucursal)
);

CREATE TABLE sucursales (
    codigo INT PRIMARY KEY,
    id_sucursal INT NOT NULL,
    localidad VARCHAR(50),
	direccion VARCHAR(70),
    producto varchar(50),
    /*
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    stock_maximo INT NOT NULL,
    */
    FOREIGN KEY (id_sucursal) REFERENCES producto(id_producto)
);

CREATE TABLE facturas(
    letra CHAR(1) NOT NULL,
    nro_pedido INT PRIMARY KEY auto_increment,
    fecha DATE NOT NULL,
    id_producto INT NOT NULL,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    forma_de_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY (id_sucursal) REFERENCES sucursales(id_sucursal)
);
