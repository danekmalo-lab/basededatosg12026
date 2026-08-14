/* 
===================================================================================
Ejercico extra con la base de datos Northwind
===================================================================================
*/

USE NORTHWND;

--Seleccionar las ventas para los clentes TOMPS,VICE
-- Mostrar las ventas realizadas en Francia, brazil y belgica
-- de 10 de julio e 1996 al 31 de Diciembre de 1998, que tenga Region de Envio,
-- para los clientes VICTE, HANAR y SUPRD, y ordenados por fecha de pedido de la mas
-- cercana a la mas antigua.


SELECT 
o.OrderID AS numero_order,
o.CustomerID AS Cliente,
o.ShipCountry AS pais_envio,
o.OrderDate AS fecha_orden,
UPPER(FORMAT (o.OrderDate,('MMM'), 'es-ES')) AS [mes_orden],
UPPER(FORMAT (o.OrderDate,('ddd'), 'es-ES')) AS [dia_orden],
DATEPART(YEAR, o.OrderDate) AS [año_orden]
FROM Orders AS o
WHERE o.shipCountry IN ('France', 'Bazil', 'Belgium')
AND 
o.CustomerID IN ('VICTE', 'HANAR' ,'SUPRD')
AND 
o.OrderDate BETWEEN '1996-07-10 ' AND '1998-12-24'
ORDER BY o.OrderDate ASC;


-- Comodin de un caracter 
-- El "gion bajo" Representa exactamente un caracter 
