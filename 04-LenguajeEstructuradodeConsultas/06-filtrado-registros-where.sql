/*------------------------------------------------------------------------
==========================================================================

DQL (Data Query Lenguaje en SQLSERVER)

Archivo 06-filtrado-registros-where.sql

Descripcion se recupera unicamente las filas que cumplen dterminadas 
concdiciones mediate la clausula where

ORDEN SINTACTICO 
SELECT / TOP / DISTINCT
FROM
JOINS / ON
WHERE
GROUP BY
HAVING
ORDER BY


ORDER DE EJECUCIÓN 
FROM / JOINS (INNER, LEFT, RIGHT, CROSS, FULL, SELECT) 
WHERE
GROUP BY
HAVING
SELECT
DISTINCT
ORDER BY
TOP


OPERADORES RELACIONALES
= Igual que
< Menor que
> Mayor que
<= Menor o igual que
>= Mayor o igual que
<> Diferente que
!= Diferente que (menos utilizado)


OPERADORES LOGICOS
NOT 
AND 
OR 

OPERADORES ARITMETICOS
(   ) 
*, /, % 
+, -
--------------------------------------------------------------------------
==========================================================================
*/


*========================================================================
 
 Sintaxis
 
 SELECT
 	columna_1,
 	columna_2,
 	columna_n,
 FROM nombre_tabla
 WHERE condicion;
 
Nota: condición puede ser relacinal y a combinación de esta con lógica.
Nota: El SELECT no filtra registros

==========================================================================*/

-- Selecionar el producto es $200
SELECT
	p.codigo AS [Codigo],
	p.nombre AS [Producto],
	p. precio AS [precio],
FROM productos AS p;
WHERE precio = 200;

-- Selecionar el cliente cuyo identificador es 25

SELECT
	c.id_cliente,
	CONCAT (c.nombre '',)
			c.apellido_paterno '',
			c.apellido_materno) AS nombre_completo,
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;


-- Comparación de cadenas de texto
-- Los valores de texto deben escribirse entre comillas simples

-- Seleccionar las categorias donde el nombre sea Cómputo
SELECT
	c.nombre AS [Categoria],
FROM categorias AS c
WHERE c.nombre = 'Cómputo';


--Seleccionar los datos del cliete con nombre Cliente1
SELECT 
	c.cliente
	CONCAT (c.nombre '',)
			c.apellido_paterno '',
			c.apellido_materno) AS nombre_completo,
	c.correo
FROM clientes AS c
WHERE nombre = 'Cliente1';


-- Seleccionar los datos del empleado que no pertenezcan al departamento
SELECT
	c.id_cliente,
	CONCAT (c.nombre '',)
			c.apellido_paterno '',
			c.apellido_materno) AS nombre_completo,
	c.correo
FROM clientes AS c
WHERE c.id_cliente = 25;


-- Seleccionar los datos de los productos donde el precio sea superior a $490

-- Seleccionar los datos de los productos con existencia critica inferior a 
-- 10 Unidades 

-- Selecciona los datos de los empleados donde su salario sea de $30,000 en
-- adelate

-- Seleccionar los datos de los productos donde sus precios sean de $10 o menos


-- Comparación de fecha