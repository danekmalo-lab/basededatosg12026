-- Crear base de datos prueba g1

--permite crear una base de datos(SQL-LDD)
CREATE DATABASE prueba1;

--utilizar base ede datos
USE prueba1;

-- crear una tabla (SQL-LDD)

CREATE TABLE alumno (
id INT NOT NULL,
nombre VARCHAR(20) NOT NULL,
edad INT not null,
matricula INT NOT NULL,
direccion VARCHAR(20) NULL.
CONSTRAINT pk_alumno
PRIMARY KEY (id),
CONSTRAINT unique_matricula
UNIQUE (matricula)
);

-- AGREGAR 2 ALUMNOS(SQL-LMD)
INSERT INTO alumno (id, nombre, edad, matricula, direccion)
VALUES (1, 'ARCADIA', 65 , 123456, 'CALLE ZIGUATANEJO'),
       (2, 'NARNIA', 19 , 123457, 'CALLE BARRIO');
       
--SELECCIONAR LOS ALUMNOS(SQL-LMD)
SELECT *
FROM alumno;
SET nombre = 'MONICO'
WHERE id = 1;





CREATE DATABASE pruebaatributos;

CREATE TABLE alumno(
num_alumno int not null primary key,
nombre varchar(50) not null,
apellido_1 varchar (30) not null,
apellido_2 varchar (30) NULL,
fecha_naci date NOT NULL
);

INSERT INTO alumno
VALUES (1,'ANGEL PATRICIO', 'PEREZ','HERNANDEZ','1998-09-08');

INSERT INTO alumno
VALUES (2,'IAN URIEL','RIZO',NULL,'2007-02-25');

SELECT *
FROM alumno;


SELECT nombre, apellido_1, apellido_2, year(fecha_naci),
       MONTH(fecha_naci), DAY(fecha_naci),
       (DATEDIFF(year, fecha_naci, GETDATE())) AS edad
FROM alumno;