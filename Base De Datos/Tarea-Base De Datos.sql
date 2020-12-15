/*Autor: Francisco Antonio Barraza Lugo*/
--Taller De Base De Datos    10:00 - 11:00

/* Creacion de base de datos*/
create database Northwind
use Northwind
/****************Create*****************/
/*Tabla Employees*/
create table Employees (
Employee_id int not null,
Lastname varchar(20) not null,
FirstName varchar(20)not null,
Title varchar(30)  null,
TitleofCourtesy varchar(20) null,
BirthDate datetime null,
HireDate datetime null,
Addres varchar(60) null,
City varchar(15) null,
Region varchar(15) null,
PostalCode varchar(10)null,
Country varchar(15) null,
HomePhone varchar(20) null,
Extension varchar(10) null,
Photo image null,
Notes char(20) null,
ReportsTo int null,
PhotoPath varchar(25) null,
)
go
/*Tabla Supplier*/
CREATE TABLE SUPPLIER(
SupplierId int not null,
CompanyName varchar(40) not null,
ContactName varchar(30) null,
ContactTitle varchar(30) null,
Addres varchar(50) null,
City varchar(15) null,
Region varchar(15) null,
PostalCode varchar(10)null,
Country varchar(15) null,
Phone varchar(24) null,
Fax varchar(24) null,
HomePage text null,
)
go
/*Tabla Products*/
create table Products(
ProductId int not null,
ProductName varchar(20) not null,
SupplierId int null,
CategoryId int null,
QuantityPerUnit varchar(25) null,
UnitPrice float null check (UnitPrice>0),
UnitsInStock int null,
UnitsOnOrder int null,
ReorderLevel int null,
Discontinued bit not null,
)
go
/*Tabla Region*/
create table Region(
RegionId int not null,
RegionDescription varchar(50) not null,
)
go
/*Tabla Order Details*/
create table OrderDetails(
OrderId int not null,
ProductId int not null,
UnitPrice float not null check (UnitPrice>0), 
Quantity int not null,
Discount real not null,
)
go
/*Tabla Categories*/
create table Categories(
CategoryId int not null,
CategoryName varchar(20) not null,
Description varchar(15) null,
Picture image null,
)
go
/*Tabla EmployeeTerritories*/
create table EmployeeTerritories(
EmployeedId int not null,
TerritoryId varchar(20) not null,
)
go
/*Tabla Territories*/
create table Territories(
TerritoryId varchar(20) not null,
TerritoryDescrip varchar(30) not null,
RegionId int not null,
)
go
/*Tabla Orders*/
create table Orders(
OrderId int not null,
CustomerId int null,
EmployeeId int null,
OrderDate datetime null,
RequiredDate datetime null,
ShippedDate datetime null,
ShipVia int null,
Freight float null,
ShipName varchar(40),
ShipAdress varchar(40) null,
ShipCity varchar(15) null,
ShipRegion varchar(15) null,
ShipPostalCode varchar(20) null,
ShipCountry varchar(15) null,
)
go
/*Tabla Customers*/
create table Customers(
CustomerId int not null,
CompanyName varchar(40) not null,
ContactName varchar(30) null,
ContactTitle varchar(30) null,
Addres varchar(60) null,
City varchar(15) null,
Region varchar(15) null,
PostalCode varchar(10)null,
Country varchar(15) null,
Phone varchar(20) null,
Fax varchar(24) null,
)
go
/*Tabla Shippers*/
create table Shippers(
ShipperId int not null,
CompanyName varchar(40) not null,
Phone varchar(24) null,
)
go
/*Tabla CustomerCustomerDemo*/
create table CustomerCustomerDemo(
CustomerId int not null,
CustomerTypeId varchar(10) not null,
)
go
/*Tabla CustomerDemographics*/
create table CustomerDemographics(
CustomerTypeId varchar(10) not null,
CustomerDesc varchar(50) null,
)
go

/***********Check************/
Alter table Employees add Check (BirthDate<Getdate())
Alter table Employees add Check (HireDate<Getdate())
Alter table Customers add Check (Phone like '(667)[1-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
Alter table SUPPLIER add Check  (Phone like '(667)[1-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
Alter table Shippers add Check  (Phone like '(667)[1-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')
Alter table Customers add Check (Addres like '%_@_%.%')
Alter table Orders add Check (ShipAdress  like '%_@_%.%')
Alter table SUPPLIER add Check (Addres like '%_@_%.%')
Alter table Employees add Check (Addres like '%_@_%.%')

/*************Alter Table  Primary Key ***************/
Alter table Employees
add constraint pk_Employeesid
primary key(Employee_id)

Alter table Products
add constraint pk_Productsid
primary key(ProductId)

Alter table Orders
add constraint pk_OrderId
primary key (OrderId)

Alter table OrderDetails
add constraint pk_OrderDetails
primary key (OrderId,ProductId)

Alter table SUPPLIER
add constraint pk_SupplierId
primary key (SupplierId)

Alter table Region
add constraint pk_Region
primary key (RegionId)

Alter table Categories
add constraint pk_Categories
primary key (CategoryId)

Alter table EmployeeTerritories
add constraint pk_EmployeeTerri
primary key (EmployeedId,TerritoryId)

Alter table Territories
add constraint pk_territories
primary key(TerritoryId)

Alter table Customers
add constraint pk_Customers
primary key(CustomerId)

Alter table CustomerCustomerDemo
add constraint pk_CustomerDemo
primary key(CustomerId,CustomerTypeId)

Alter table CustomerDemographics
add constraint pk_CustomerDemoGra
primary key(CustomerTypeId)

Alter table Shippers
add constraint pk_Shippers
primary key(ShipperId)

/***************Alter Table Foreign Key*****************/
/*Tabla Products*/
Alter table Products
add constraint fk_ProductsCategory
foreign key(CategoryId) 
references Categories(CategoryId)

Alter table Products
add constraint fk_ProductsSupplier
foreign key(SupplierId) 
references SUPPLIER(SupplierId)

/*Tabla Orders*/
Alter table Orders
add constraint fk_OrdersCustomers
foreign key(CustomerId)
references Customers(CustomerId)

Alter table Orders
add constraint fk_OrdersShippers
foreign key(ShipVia)
references Shippers(ShipperId)

Alter table Orders
add constraint fk_OrdersEmployees
foreign key(EmployeeId)
references Employees(Employee_id)
/*Tabla OrderDetails*/
Alter table OrderDetails
add constraint fk_OrdersDetaProducts
foreign key(ProductId)
references Products(ProductId)

Alter table OrderDetails
add constraint fk_OrdersDetaOrder
foreign key(OrderId)
references Orders(OrderId)
/*Tabla Employees*/
Alter table Employees
add constraint fk_Employees
foreign key(ReportsTo)
references Employees(Employee_id)
/*Tabla EmployeeTerritories*/
Alter table EmployeeTerritories
add constraint fk_EmployeesTerritoriesEmp
foreign key(EmployeedId)
references Employees(Employee_id)

Alter table EmployeeTerritories
add constraint fk_EmployeesTerritoriesTerr
foreign key(TerritoryId)
references Territories(TerritoryId)
/*Tabla CustomerCustomerDemo*/
Alter table CustomerCustomerDemo
add constraint fk_CustomerCustomerDemoCust
foreign key(CustomerId)
references Customers(CustomerId)

Alter table CustomerCustomerDemo
add constraint fk_CustomerCustomerDemoDemo
foreign key(CustomerTypeId)
references CustomerDemographics(CustomerTypeId)








/*****************Insercion De Datos***********************/
/*
insert into Categories (CategoryId ,CategoryName) values(1,'Electronica')
,(2,'Electrodomesticos'),(3,'Oficina');
insert into SUPPLIER(SupplierId ,CompanyName) values(1,'Asus')
,(2,'HP'),(3,'Whirpool');
insert into Region(RegionId ,RegionDescription) values(1,'Norte')
,(2,'Noroeste'),(3,'Sur');
insert into Region(RegionId ,RegionDescription) values(1,'Norte')
,(2,'Noroeste'),(3,'Sur');
insert into Products(ProductId ,ProductName,SupplierId,CategoryId,Discontinued) values(1,'Computadora',1,1,10)
,(2,'Computadora',2,1,10),(3,'Escritorio',2,3,10);
insert into Territories(TerritoryId ,TerritoryDescrip,RegionId) values(1,'CUliacan',1)
,(2,'Mazatlan',3),(3,'Guadalajara',1);
insert into Orders(OrderId,CustomerId,EmployeeId) values(1,2,1)
,(2,1,1),(3,3,1);
insert into Employees(Employee_id,Lastname,FirstName) values(1,'Barraza','Francisco')
,(2,'Lugo','Antonio'),(3,'Perez','Juan');
insert into Customers(CustomerId,CompanyName) values(1,'SA Y Asociados')
,(2,'FormaTec'),(3,'Asociados');
insert into OrderDetails(ProductId,OrderId,UnitPrice,Quantity,Discount) values(1,1,5000,5,10)
,(1,2,7000,4,10),(1,3,3000,2,10);
insert into EmployeeTerritories(EmployeedId,TerritoryId) values(1,1)
,(2,1),(3,3);
insert into Shippers(ShipperId,CompanyName) values(1,'SA Y Asociados')
,(2,'FormaTec'),(3,'Asociados');
insert into CustomerDemographics(CustomerTypeId,CustomerDesc) values(1,'La empresa esta en culiacan')
,(2,'FormaTec esta en mazatlan'),(3,'se encuentra en jalisco');
insert into CustomerCustomerDemo(CustomerId,CustomerTypeId) values(1,1)
,(2,1),(3,3);
*/
