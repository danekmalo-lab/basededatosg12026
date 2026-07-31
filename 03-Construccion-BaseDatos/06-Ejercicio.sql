CREATE DATABASE EscuelaNuevo;
GO

USE EscuelaNuevo;
GO

CREATE TABLE Alumno (
    Matricula VARCHAR(20) NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    correo VARCHAR(100),
    fechaNaci DATE,
    PRIMARY KEY (Matricula)
);
GO

CREATE TABLE Departamento (
    numDepa INT IDENTITY(1,1),
    nombre VARCHAR(100) NOT NULL,
    Edificio VARCHAR(50),
    PRIMARY KEY (numDepa)
);
GO

CREATE TABLE Proyects (
    NumberProyects INT IDENTITY(1,1),
    NameProyects VARCHAR(100) NOT NULL,
    Presupuesto DECIMAL(12,2),
    PRIMARY KEY (NumberProyects)
);
GO


CREATE TABLE Telefono (
    TelefonoID INT NOT NULL,
    Matricula VARCHAR(20) NOT NULL,
    numeroTotal VARCHAR(20) NOT NULL,
    PRIMARY KEY (TelefonoID, Matricula),
    CONSTRAINT FK_Telefono_Alumno 
        FOREIGN KEY (Matricula) 
        REFERENCES Alumno(Matricula)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Credencial (
    Numcredencial INT IDENTITY(1,1),
    FechaInscripcion DATE NOT NULL,
    Vigencia DATE NOT NULL,
    Matricula VARCHAR(20) NOT NULL,
    PRIMARY KEY (Numcredencial),
    CONSTRAINT FK_Credencial_Alumno 
        FOREIGN KEY (Matricula) 
        REFERENCES Alumno(Matricula)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Profesor (
    Numprofe INT IDENTITY(1,1),
    nombre VARCHAR(50) NOT NULL,
    apellido1 VARCHAR(50) NOT NULL,
    apellido2 VARCHAR(50),
    NumDepa INT NOT NULL,
    PRIMARY KEY (Numprofe),
    CONSTRAINT FK_Profesor_Departamento 
        FOREIGN KEY (NumDepa) 
        REFERENCES Departamento(numDepa)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO


CREATE TABLE Dependiente (
    NumProf INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    FechaNaci DATE,
    Parentesco VARCHAR(50),
    PRIMARY KEY (NumProf, Nombre),
    CONSTRAINT FK_Dependiente_Profesor 
        FOREIGN KEY (NumProf) 
        REFERENCES Profesor(Numprofe)
        ON DELETE CASCADE ON UPDATE CASCADE
);
GO

CREATE TABLE Materia (
    ClaveMateria VARCHAR(20) NOT NULL,
    NombreMateria VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    numProf INT NOT NULL,
    PRIMARY KEY (ClaveMateria),
    CONSTRAINT FK_Materia_Profesor 
        FOREIGN KEY (numProf) 
        REFERENCES Profesor(Numprofe)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO


CREATE TABLE Cursa (
    Matricula VARCHAR(20) NOT NULL,
    ClaveMateria VARCHAR(20) NOT NULL,
    Transcripcion TEXT,
    CalificacionFinal DECIMAL(4,2),
    PRIMARY KEY (Matricula, ClaveMateria),
    CONSTRAINT FK_Cursa_Alumno 
        FOREIGN KEY (Matricula) 
        REFERENCES Alumno(Matricula)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Cursa_Materia 
        FOREIGN KEY (ClaveMateria) 
        REFERENCES Materia(ClaveMateria)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO

CREATE TABLE Participa (
    NumProfe INT NOT NULL,
    NumProyect INT NOT NULL,
    Rol VARCHAR(50),
    FechaInicio DATE,
    PRIMARY KEY (NumProfe, NumProyect),
    CONSTRAINT FK_Participa_Profesor 
        FOREIGN KEY (NumProfe) 
        REFERENCES Profesor(Numprofe)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT FK_Participa_Proyects 
        FOREIGN KEY (NumProyect) 
        REFERENCES Proyects(NumberProyects)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO