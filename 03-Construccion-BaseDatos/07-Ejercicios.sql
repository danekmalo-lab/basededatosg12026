CREATE DATABASE Ejercicio7;
GO

USE Ejercicio7;
GO

CREATE TABLE Alumno (
Matricula VARCHAR (20) NOT NULL,
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR(50) NOT NULL,
Apellido2 VARCHAR (50),
Correo VARCHAR (100),
FechaNaci DATE,
PRIMARY KEY (Matricula)
);

CREATE TABLE Departamento (
NumDepa INT IDENTITY(1,1),
Nombre VARCHAR (100) NOT NULL,
Edificio VARCHAR (50),
PRIMARY KEY (NumDepa)
);
GO

CREATE TABLE Telefono (
TelefonoID INT IDENTITY (1,1),
Matricula VARCHAR(20) NOT NULL,
NumeroTotal VARCHAR(20),
Tel VARCHAR (20),
PRIMARY KEY (TelefonoID),
CONSTRAINT PK_Telefono_Alumno
FOREIGN KEY (Matricula)
REFERENCES Alumno(Matricula)
ON DELETE CASCADE
ON UPDATE CASCADE
);
GO
CREATE TABLE Credencial (
NumCredencial INT IDENTITY (1,1),
FechaInscripcion DATE  NOT NULL,
Vigencia DATE NOT NULL,
Matricula VARCHAR (20) NOT NULL,
Idtel INT NULL,
PRIMARY KEY (NumCredencial),
CONSTRAINT FK_CREDENCIAL_ALUMNO
FOREIGN KEY (Matricula)
REFERENCES Alumno (Matricula)
ON DELETE CASCADE 
ON UPDATE CASCADE,
CONSTRAINT FK_CREDENCUAL_TELEFONO
FOREIGN KEY (Idtel)
REFERENCES Telefono(TelefonoID)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);
GO

CREATE TABLE Profesor (
NumProfe INT IDENTITY (1,1),
Nombre VARCHAR (50) NOT NULL,
Apellido VARCHAR (50) NOT NULL,
Apellido2 VARCHAR(50),
NumDepa INT NOT NULL,
NumDep INT NULL,
Participa INT NULL,
NumProyecto INT NULL,
PRIMARY KEY (NumProfe),
CONSTRAINT FK_Profesor_departamento
FOREIGN KEY (NumDepa)
REFERENCES Departamento (NumDepa)
ON DELETE NO ACTION 
ON UPDATE CASCADE

);
GO

CREATE TABLE Proyecto (
NumProyects INT IDENTITY(1,1),
Nombre VARCHAR(100) NOT NULL,
Presupuesto DECIMAL (12,2),
Profesor INT NULL,
NumDep INT NULL,
PRIMARY KEY (NumProyects),
CONSTRAINT FK_proyects_profesor
FOREIGN KEY (Profesor)
REFERENCES Profesor(NumProfe)
ON DELETE NO ACTION 
ON UPDATE NO ACTION,
CONSTRAINT FK_proyects_departamento
FOREIGN KEY (NumDep)
REFERENCES Departamento (NumDepa)
ON DELETE NO ACTION 
ON UPDATE NO ACTION 


);
GO

CREATE TABLE Materia (
ClaveMateria VARCHAR(20) NOT NULL,
    NombreMateria VARCHAR(100) NOT NULL,
    Creditos INT NOT NULL,
    numProf INT NOT NULL,
    TotalMaterias INT,
    NumProfe INT NULL,
    PRIMARY KEY (ClaveMateria),
    CONSTRAINT FK_Materia_Profesor 
        FOREIGN KEY (numProf) 
        REFERENCES Profesor(Numprofe)
        ON DELETE NO ACTION ON UPDATE CASCADE
);
GO

CREATE TABLE Dependiente(
NumProf INT NOT NULL,
    Nombre VARCHAR(50) NOT NULL,
    FechaNaci DATE,
    Parentesco VARCHAR(50),
    NumProfe INT NULL,
    PRIMARY KEY (NumProf, Nombre),
    CONSTRAINT FK_Dependiente_Profesor 
        FOREIGN KEY (NumProf) 
        REFERENCES Profesor(Numprofe)
        ON DELETE CASCADE ON UPDATE CASCADE
); 
GO


CREATE TABLE Cursa (
Matricula VARCHAR(20) NOT NULL,
    ClaveMateria VARCHAR(20) NOT NULL,
    Transcripcion TEXT,
    CalificacionFinal DECIMAL(4,2),
    FechaInscripcion DATE,
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
        REFERENCES Proyecto(NumProyects)
        ON DELETE NO ACTION ON UPDATE CASCADE
        )
        ;
GO

ALTER TABLE Profesor 
ADD CONSTRAINT FK_Profesor_Proyects 
FOREIGN KEY (NumProyecto) 
REFERENCES Proyects(NumberProyects);
GO