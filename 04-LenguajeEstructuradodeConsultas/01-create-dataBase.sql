/*------------------------------------------------------------------------
==========================================================================


DQL (Data Query Lenguaje en SQLSERVER)

Archivo 02-Create-DataBase.sql

Descripcion Crear La base de datos para la practica de las consultas
--------------------------------------------------------------------------
==========================================================================
*/

USE master;
GO

IF DB_ID('comercial_db') IS NOT NULL
BEGIN 
ALTER DATABASE comercial_db
SET SINGLE_USER
WITH ROLLBACK IMMEDIATE;

DROP DATABASE comercial_db;
END;
GO

CREATE DATABASE comercial_db;
GO

USE comercial_db;
GO

PRINT 'La base de dar¿tos comercial se creo correctamente';
GO

--SELECT DB_ID('comercial_db')