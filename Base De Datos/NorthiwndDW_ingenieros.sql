USE NorthwindDW_ing
go
--Crear tabla countries:
CREATE TABLE Countries(
CountryID INT identity not null primary key,
CountryName varchar(25) not null,
)

GO

--Crear tabla temporal para almacenar
create table #CRCTEMP(
country varchar(69),
region varchar(69),
city varchar(69)
)

go
--insertan datos a la tabla temporal CRCTEMP usando la funcion coalesce para los campos NULL:
insert into #CRCTEMP select distinct Country,coalesce (Region,'SR'+Country),City from Employees
go
insert into #CRCTEMP select distinct Country,coalesce (Region,'SR'+Country),City from Customers
go
insert into #CRCTEMP select distinct Country,coalesce (Region,'SR'+Country),City from Suppliers
go

--insertar los paises de la tabla temporal a la tabla Countries
insert into Countries select distinct country from #CRCTEMP
go
--Crear Tabla Regions:
CREATE TABLE Regions(
RegionID INT identity not null primary key,
RegionName varchar(25) not null,
)
Go
--Insertar las regiones de la tabla temporal a la tabla Regions:
insert into regions select distinct Region from #CRCTEMP  
--agregar columna countryID a la tabla regions:
alter table Regions add CountryID int NULL
go
--agregar llave foranea a la tabla Regions:
ALTER TABLE Regions
	ADD CONSTRAINT FK_RegionsCountries
	FOREIGN KEY (CountryId) REFERENCES Countries(CountryID);
Go
--Actualizar la columna CountryID en la tabla regions con sus paises correspondientes:
Update Regions
set CountryID = co.CountryID
from #CRCTEMP c INNER JOIN Countries co ON co.CountryName = c.country 
where RegionName = c.region
go
--Hacer NOT NULL la columna CountryID en la tabla Regions
ALTER TABLE Regions ALTER COLUMN CountryID INT NOT NULL
--Crear tabla Cities:
CREATE TABLE Cities(
CityID INT identity not null primary key,
CityName varchar(25) not null,
)
GO
--Insertar las ciudades de la tabla Temporal a la tabla Cities:
insert into Cities select distinct city from #CRCTEMP
go
--Agregar la columna RegionID a la tabla Cities:
alter table Cities add RegionID int NULL
go
--Actualizar la Columna RegionID en la tabla regions con sus Regiones Correspondientes:
Update Cities
set RegionID = re.RegionID
from #CRCTEMP c INNER JOIN Regions re 
ON re.RegionName = c.region
where CityName = c.city
go
--Hacer NOT NULL la columna RegionID 
ALTER TABLE Cities ALTER COLUMN RegionID INT NOT NULL
go
--Añadir llave foranea de Regions a la tabla Cities:
ALTER TABLE Cities
	ADD CONSTRAINT FK_CitiesRegions
	FOREIGN KEY (RegionId) REFERENCES Regions(RegionID);
GO

--agregar columna cityID a la tabla employees
alter table employees add CityID int NULL
GO
--insertar los cityID a la tabla employees
Update Employees 
set CityID = c.CityID
from Cities c
where City = c.CityName

GO
--Eliminar columnas City, country,region
alter table employees drop column City, country,region

Go
--Agregar llave foranea de cities a la tabla employees
	ALTER TABLE employees
	ADD CONSTRAINT FK_employeescities
	FOREIGN KEY (CityID) REFERENCES Cities(CityID);

GO
--Hacer not null la columna cityID en Employees
	ALTER TABLE employees ALTER COLUMN CityID INT NOT NULL

GO
--Añadir columna CityID  a la tabla customers
alter table customers add CityID int NULL

GO
--insertar los CityID a la tabla Customers
	Update customers 
	set CityID = c.CityID
	from Cities c
	where City = c.CityName

GO
--eliminar indices de la tabla customers para poder borrarla
	DROP INDEX City
	on Customers

GO

	DROP INDEX Region
	on Customers

	GO
 --Eliminar columnas City, country,region en la ta
alter table customers drop column City, Country,Region

GO
--añadir llave foranea de cities a la tabla customers
	ALTER TABLE CUSTOMERS
	ADD CONSTRAINT customerscities
	FOREIGN KEY (CityID) REFERENCES Cities(CityID);

GO
--Hacer not null la columna CityID en Customers:
	ALTER TABLE customers ALTER COLUMN CityID INT NOT NULL

GO
--Añadir columna CityID a la tabla Suppliers:
alter table Suppliers add CityID int NULL

GO
--Insertar los cityID a la tabla Suppliers:
Update Suppliers
set CityID = c.CityID
from Cities c
where City = c.CityName

GO
--Eliminar las columnas City, country,region:
alter table Suppliers drop column City, country,region

Go
--Añadir llave foranea de cities a la tabla Suppliers
	ALTER TABLE Suppliers
	ADD CONSTRAINT FK_Supplierscities
	FOREIGN KEY (CityID) REFERENCES Cities(CityID);

GO
--Hacer la columna cityID not null:
	ALTER TABLE Suppliers ALTER COLUMN CityID INT NOT NULL

go
--.

