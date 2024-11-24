drop database if exists cafeteria;
create database cafeteria;
use cafeteria;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY, 
    nombre VARCHAR(50) NOT NULL,
    domicilio VARCHAR(50) NOT NULL,
    dni CHAR(8) NOT NULL,
    telefono VARCHAR(10)
/*    email VARCHAR(50),
    clave varchar(50)*/
);

CREATE TABLE sucursales(
    codigo_sucursal INT PRIMARY KEY,
    id_sucursal INT AUTO_INCREMENT UNIQUE KEY,
    localidad VARCHAR(50),
    direccion VARCHAR(70),
    producto varchar(50)
    -- FOREIGN KEY (codigo_sucursal) REFERENCES productos(codigo_sucursal)
);

CREATE TABLE productos(
    codigo_sucursal INT NOT NULL,
	id_producto INT PRIMARY KEY,
    tipo VARCHAR(50),
    producto varchar(50),
    precio double,
    stock_actual INT NOT NULL,
    stock_minimo INT NOT NULL,
    stock_maximo INT NOT NULL,
    FOREIGN KEY (codigo_sucursal) REFERENCES sucursales(codigo_sucursal)
);

CREATE TABLE facturas(
    letra CHAR(1) NOT NULL,
    nro_pedido INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_producto INT NOT NULL,
    id_cliente INT NOT NULL,
    id_sucursal INT NOT NULL,
    forma_de_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
    -- FOREIGN KEY (id_sucursal) REFERENCES sucursales(codigo_sucursal)
);


-- -----------------------------------------------------------------------------------------------------------

INSERT INTO clientes (nombre, domicilio, dni, telefono) VALUES -- email, clave) VALUES
	('Juan Perez', 'Corrientes 2678', '12345678', '987654321'), -- 'juan.perez@gmail.com','abcd1234'),
    ('María Flores', 'Florida 876', '87654321', '123456789'), -- 'maria.flores@gmail.com','11223344'),
    ('Carlos Rodriguez', 'Cabildo 4321', '23456789', '567890123'), -- 'carlos.rodriguez@hotmail.com','holacarlos'),
    ('Lucía Franco', 'Thames 543', '34567812', '654321789'), -- 'lucia.franco@outlook.com','luci1995'),
    ('Martín Díaz', 'Santa Fe 1890', '98765432', '321789456'), -- 'martin.diaz@outlook.co','martin2024'),
    ('Carolina López', 'Lavalle 300', '45678123', '789456123'), -- 'carolina.lopez@gmail.com','22caro22'),
    ('Fernando Martínez', 'Rivadavia 5678', '78901234', '456123789'), -- 'fernando.martinez@yahoo.com.ar','1995fernan'),
    ('Valeria García', 'Juan B. Justo 4321', '12345678', '123789456'), -- 'valeria.garcia@yahoo.com','valen1010'),
    ('Miguel Sánchez', 'Scalabrini Ortiz 2765', '56781234', '789456123'), -- 'miguel.sanchez@gmail.com','miguelelmejor'),
    ('Camila Fernández', 'Gorriti 234', '12347890', '456789012'), -- 'camila.fernandez@outlook.com','camiii777'),
    ('Diego Britos', 'Honduras 1765', '78904561', '234567890'), -- 'diego.britos@','britoslol'),
    ('Brenda Giménez', 'Billinghurst 543', '34561230', '567890123'), -- 'brenda.gimenez@gmail.com','Brendaaaa'),
    ('Marcelo Alvarez', 'Borges 4321', '78904561', '234567890'), -- 'marcelo.alvarez@hotmail.com','clave1234'),
    ('Romina Smith', 'Gurruchaga 1765', '34561230', '567890123'), -- 'romina.smith@gmail.com','amolosperros'),
    ('Eduardo Romero', 'Rivadavia 7890', '12034567', '678901234'); -- 'eduardo.romero@gmail.com','amolosgatos');

    INSERT INTO sucursales (codigo_sucursal, id_sucursal, localidad, direccion) values
    (1, 1, 'Villa del Parque', 'Av. Corrientes 4200'),
    (2, 2, 'Villa Devoto', 'Calle Arenal 1350'),
    (3, 3, 'Villa Crespo', 'Av. Santa Fe 5200'),
    (4, 4, 'Villa Luro', 'Calle Guise 2150'),
    (5, 5, 'Balvanera', 'Av. 9 de Julio 1900');

INSERT INTO productos(codigo_sucursal, id_producto, tipo, producto, precio, stock_actual, stock_minimo, stock_maximo) VALUES
    ('1', '1', 'bebida', 'Mocaccino', '2400','100', '10', '150'),
    ('2', '2', 'bebida','Iced Americano', '2400', '80', '5', '120'),
    ('3', '3', 'bebida','Expresso', '2400', '50', '8', '80'),
    ('4', '4', 'bebida','Chai latte', '2400', '30', '5', '50'),
    ('5', '5', 'panaderia_pasteleria','Muffin', '1000', '60', '10', '80'),
    ('1', '6', 'panaderia_pasteleria','Medialuna', '400', '40', '8', '60'),
    ('2', '7', 'panaderia_pasteleria','Tostado', '800', '25', '5', '40'),
    ('3', '8', 'panaderia_pasteleria','Waffles', '1200', '20', '5', '30'),
    ('4', '9', 'panaderia_pasteleria','Alfajor de Maicena', '300', '15', '3', '25'),
    ('5', '10', 'panaderia_pasteleria','Dona', '600', '35', '7', '55'),
    ('1', '11', 'panaderia-pasteleria','Churro', '400', '28', '6', '45'),
    ('2', '12', 'bebida','Matcha latte', '2400', '22', '4', '35'),
    ('3', '13', 'bebida','Cortado', '2400', '50', '10', '70'),
    ('4', '14', 'bebida','Submarino', '3600', '50', '10', '70'),
    ('5', '15', 'panaderia_pasteleria','Pretzel', '700', '50', '10', '70'),
    ('1', '16', 'panaderia_pasteleria','Budin Marmolado', '1700', '50', '10', '70'),
    ('2', '17', 'panaderia_pasteleria','Pebete', '1300', '50', '10', '70'),
    ('3', '18', 'panaderia_pasteleria','rainbow cake', '3600', '50', '10', '70'),
    ('4', '19', 'panaderia_pasteleria','Sanguchito de Miga', '800', '50', '10', '70'),
    ('5', '20', 'panaderia_pasteleria','torta red velvet', '3700', 50, 10, 70),
    ('1', '21', 'bebida','limonada con jengibre y menta', '1400', '50', '10', '70'),
    ('2', '22', 'bebida','limonada de maracuya', '150', '50', '1400', '70'),
    ('3', '23', 'panaderia_pasteleria','mousse de chocolate', '4000', '50', '10', '70');
    
select * from productos;

INSERT INTO facturas (letra, nro_pedido, fecha, id_producto, id_cliente, id_sucursal, forma_de_pago) VALUES
    ('A', 1, '2023-01-01', 1, 1, 1, 'efectivo'),
    ('B', 2, CURDATE(), 2, 2, 2, 'tarjeta'),
    ('C', 3, '2023-02-03', 3,  3, 3, 'efectivo'),
    ('A', 4, '2023-06-04', 4, 4, 4, 'efectivo'),
    ('B', 5, CURDATE(), 5, 5, 5, 'tarjeta'),
    ('C', 6, '2023-11-06', 6, 6, 6, 'efectivo'),
    ('A', 7, '2023-01-01', 7, 7, 7, 'tarjeta'),
    ('B', 8, '2023-09-10', 8, 8, 8, 'efectivo'),
    ('B', 9, '2023-08-09', 9, 9, 9, 'tarjeta'),
    ('C', 10, '2023-03-25', 10, 10, 10, 'efectivo'),
    ('C', 11, '2023-07-30', 11, 11, 11, 'tarjeta'),
    ('A', 12, '2023-04-02', 12, 12, 12, 'tarjeta'),
    ('C', 13, '2023-01-13', 13, 13, 13, 'efectivo'),
    ('A', 14, '2023-12-14', 14, 14, 14, 'tarjeta'),
    ('B', 15, '2023-12-14', 15, 15, 15, 'efectivo');
    
select * from facturas;
