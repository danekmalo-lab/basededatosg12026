/*------------------------------------------------------------------------
==========================================================================


DQL (Data Query Lenguaje en SQLSERVER)

Archivo 05-Create-DataBase.sql

Descripcion Crear La base de datos para la practica de las consultas
este archivo se creeara consultas basicas con SELCT
--------------------------------------------------------------------------
==========================================================================
*/
USE comercial_db
--Uso de SELECT *
/*
--SINTAXIS
SELECT * 
FROM Nombre_tabla;
*= el Asterisco significa todas la columnas de la fila
No se Recomienda Utilizarla siempre 
1) Reduce la claridad de la consulta 
2) Puede aumentar el consumo de recursos
3) Puede afectar apliacaciones futuras
##Se recomienda para tablas pequeñas y no grandes 
4) 

*/
/*Tratar de evitar este 
SELECT *
FROM productos;
*/
SELECT codigo,
       nombre,
       precio
FROM productos;
GO
SELECT precio,
       nombre,
       codigo
FROM productos;
GO

--Aleas de columna (Sobre nombre se le pone un campo)
-- Ejemplo basico 
-- AS solo sirver para identificar o para que que los usuarios lo entiendan
-- Aleas con espacios , [] sirver para marcar los espacios en blanco
SELECT 
     codigo AS [codigo_producto],
     nombre AS [nombre_producto],
     precio AS [precio_unitario]
FROM productos;
GO

SELECT 
     codigo AS 'codigo_producto',
     nombre AS 'nombre_producto',
     precio AS 'precio_unitario'
FROM productos;
GO

-- Alias sin la instruccion AS (no recomendado)
-- Aleas con espacios , [] sirver para marcar los espacios en blanco
SELECT 
     codigo AS [codigo producto],
     nombre AS [nombre producto],
     precio AS [precio unitario]
FROM productos;
GO

-- Alias de tabla 
-- Es util en los joins y en nombres ambiguos
SELECT 
       p.precio,
       p.nombre,
       p.codigo
FROM productos AS p;
GO

SELECT
c.id_categoria,
c.nombre,
c.id_producto,
p.nombre,
p.precio
FROM categorias AS c
INNER JOIN
productos AS p
ON c.id_categoria=p.id_categoria;

SELECT 
       p.precio AS Codigo,
       p.nombre AS [Nombre Producto],
       p.codigo AS 'Precio Unitario '
       FROM productos AS p;

       -- columnas calculadas , campos calculados y E-R (Atributos Deribados)
-- Seleccionar el codigo nombre , precio , existenciia y el valor del inventario

SELECT 
     p.codigo AS codigo_producto, 
     p.nombre AS nombre_producto,
     p.precio precio_unitario,
     p.existencia,
     (p.precio * p.existencia) AS precio_inventario     
FROM productos AS P;

---TODO: Operdores aritmeticos

