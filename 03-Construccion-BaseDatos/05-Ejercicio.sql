USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Ejercicio5')
BEGIN
    ALTER DATABASE Ejercicio5 SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Ejercicio5;
END
GO

CREATE DATABASE Ejercicio5;
GO

USE Ejercicio5;
GO

CREATE TABLE Empleado (
    IDEmploye INT IDENTITY(1,1),
    FirstName VARCHAR(50) NOT NULL,
    SNN VARCHAR(20) NOT NULL,
    Address VARCHAR(100),
    Salary DECIMAL(10,2),
    Serv VARCHAR(50),
    Birthday DATE,
    NumDepartament INT NULL,
    Jef INT NULL,
    PRIMARY KEY (IDEmploye)
);
GO

CREATE TABLE Departamento (
    NumDep INT IDENTITY(1,1),
    Nombre VARCHAR(50) NOT NULL,
    StardDate DATE,
    Manager INT NULL,
    PRIMARY KEY (NumDep)
);
GO

CREATE TABLE Locations (
    NumLocations INT IDENTITY(1,1),
    NumDep INT NOT NULL,
    NameLocations VARCHAR(100) NOT NULL,
    PRIMARY KEY (NumDep, NumLocations),
    CONSTRAINT FK_Locations_Departamento 
        FOREIGN KEY (NumDep) 
        REFERENCES Departamento(NumDep)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Proyects (
    NumProyects INT IDENTITY(1,1),
    NameProyects VARCHAR(100) NOT NULL,
    Locations VARCHAR(100),
    NumDep INT NOT NULL,
    PRIMARY KEY (NumProyects),
    CONSTRAINT FK_Proyects_Departamento 
        FOREIGN KEY (NumDep) 
        REFERENCES Departamento(NumDep)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO
CREATE TABLE WORKS_ON (
    EmployedID INT NOT NULL,
    NumberProyect INT NOT NULL,
    Hours DECIMAL(5,2),
    PRIMARY KEY (EmployedID, NumberProyect),
    CONSTRAINT FK_Workson_Empleado 
        FOREIGN KEY (EmployedID) 
        REFERENCES Empleado(IDEmploye)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Workson_Proyects 
        FOREIGN KEY (NumberProyect) 
        REFERENCES Proyects(NumProyects)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO


CREATE TABLE Dependiente (
    DependientID INT IDENTITY(1,1),
    Employe INT NOT NULL,
    Name VARCHAR(50) NOT NULL,
    Sex CHAR(1),
    Birthday DATE,
    RelationShip VARCHAR(50),
    PRIMARY KEY (DependientID),
    CONSTRAINT FK_Dependiente_Empleado 
        FOREIGN KEY (Employe) 
        REFERENCES Empleado(IDEmploye)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

ALTER TABLE Empleado 
ADD CONSTRAINT FK_Empleado_Departamento 
FOREIGN KEY (NumDepartament) 
REFERENCES Departamento(NumDep);
GO

ALTER TABLE Empleado 
ADD CONSTRAINT FK_Empleado_Jefe 
FOREIGN KEY (Jef) 
REFERENCES Empleado(IDEmploye);
GO

ALTER TABLE Departamento 
ADD CONSTRAINT FK_Departamento_Manager 
FOREIGN KEY (Manager) 
REFERENCES Empleado(IDEmploye);
GO