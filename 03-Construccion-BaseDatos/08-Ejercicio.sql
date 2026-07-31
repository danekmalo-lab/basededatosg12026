CREATE DATABASE Ejercico8;
GO

USE Ejercico8;
GO

CREATE TABLE Oficina (
Oficina_id INT IDENTITY(1,1),
    Ciudad VARCHAR(30) NOT NULL,
    region VARCHAR(20) NOT NULL,
    objetivo DECIMAL(10,2) NOT NULL,
    ventas DECIMAL(10,2) NOT NULL,
    representante_id INT NOT NULL,
    PRIMARY KEY (Oficina_id)
);
GO

CREATE TABLE Representante (
RepresentanteID INT IDENTITY(1,1) NOT NULL,
Nombre VARCHAR (15)  NOT NULL,
Apellido VARCHAR (15) NOT NULL,
Apellido2 VARCHAR (15) NULL,
Fecha_Contrato Date NOT NULL,
Edad INT NOT NULL,
Puesto VARCHAR (15) NOT NULL,
Custa DECIMAL (10,2) NOT NULL,
Ventas DECIMAL (10,2) NOT NULL,
representante_id_Jefe INT NULL,
Oficina_ID INT NULL,
PRIMARY KEY (RepresentanteID)
);
GO

CREATE TABLE Cliente(
Cliente_id INT IDENTITY(1,1),
Empresa VARCHAR (30) NOT NULL,
Limite_credito DECIMAL(10,2) NOT NULL,
RepresentanteID INT NOT NULL,
PRIMARY KEY (Cliente_id),
CONSTRAINT FK_Cliente_Representante
FOREIGN KEY (RepresentanteID)
REFERENCES Representante (RepresentanteID)
ON DELETE NO ACTION
ON UPDATE CASCADE

);
GO
CREATE TABLE Producto (
    Producto_id CHAR(5) NOT NULL,
    Fab_id CHAR(3) NOT NULL,
    descripcion VARCHAR(90) NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    existencia INT NOT NULL,
    PRIMARY KEY (Producto_id, Fab_id)
);
GO

CREATE TABLE Pedido (
    Pedido_id INT IDENTITY(1,1),
    fecha_pedido DATE NOT NULL,
    cliente_id INT NOT NULL,
    representante_id INT NOT NULL,
    PRIMARY KEY (Pedido_id),
    CONSTRAINT FK_Pedido_Cliente 
        FOREIGN KEY (cliente_id) 
        REFERENCES Cliente(cliente_id)
        ON DELETE NO ACTION ON UPDATE CASCADE,
    CONSTRAINT FK_Pedido_Representante 
        FOREIGN KEY (representante_id) 
        REFERENCES Representante(RepresentanteID)
        ON DELETE NO ACTION ON UPDATE NO ACTION
);
GO

-- Tabla Detalle_pedido
CREATE TABLE Detalle_pedido (
    Pedido_id INT NOT NULL,
    Producto_id CHAR(5) NOT NULL,
    Fab_id CHAR(3) NOT NULL,
    Cantidad INT NOT NULL,
    Precio DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (Pedido_id, Producto_id, Fab_id),
    CONSTRAINT FK_Detalle_Pedido 
        FOREIGN KEY (Pedido_id) 
        REFERENCES Pedido(Pedido_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Detalle_Producto 
        FOREIGN KEY (Producto_id, Fab_id) 
        REFERENCES Producto(Producto_id, Fab_id)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO

-- -----------------------------------------------------
-- 3. LLAVES FORÁNEAS CRUZADAS Y AUTORREFERENCIAS
-- -----------------------------------------------------

-- Jefe del Representante (Autorreferencia)
ALTER TABLE Representante 
ADD CONSTRAINT FK_Representante_Jefe 
FOREIGN KEY (representante_id_jefe) 
REFERENCES Representante(representante_id);
GO

-- Oficina asignada al Representante
ALTER TABLE Representante 
ADD CONSTRAINT FK_Representante_Oficina 
FOREIGN KEY (oficina_id) 
REFERENCES Oficina(oficina_id);
GO

-- Representante encargado de la Oficina
ALTER TABLE Oficina 
ADD CONSTRAINT FK_Oficina_Representante 
FOREIGN KEY (representante_id) 
REFERENCES Representante(representante_id);
GO