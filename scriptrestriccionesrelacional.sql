-- Crear Base de datos 

CREATE DATABASE dbconstraint;
GO 

--USAR BASE DE DATOS
USE dbconstraint;
GO

--RAZON DE CARDINALIDAD 1:1

--CREAR TABLA PACIENTE 
CREATE TABLE paciente(
    iIdpaciente INT NOT NULL,
    Nombre VARCHAR (40) NOT NULL,
    apellido1 VARCHAR (20) NOT NULL,
    apellido2 VARCHAR (20) NULL,
    fechanaci DATE NOT NULL,
    CONSTRAINT pk_paciente
    PRIMARY KEY (iIdpaciente)
);
GO 
CREATE TABLE expediente(
Idexp INT NOT NULL PRIMARY KEY,
Fechaapertura DATE NOT NULL,
Tiposangre CHAR(3) NULL,
Idpaciente INT NOT NULL,
CONSTRAINT unique_Idpaciente
UNIQUE (Idpaciente),
CONSTRAINT fk_expediente_paciente
FOREIGN KEY (Idpaciente)
REFERENCES paciente(iIdpaciente )
);
GO

-- Datos para las tablas 
INSERT INTO paciente 
VALUES (4, 'Kevin','Yair','Lemus','2007-02-06')
--INSERT EXPEDIENTE 
INSERT INTO expediente
VALUES (1,GETDATE(),'+o',1);

INSERT INTO expediente
VALUES (2,'2026-06-17','+o',2);
SELECT *FROM expediente

SELECT * FROM paciente;
SELECT GETDATE()