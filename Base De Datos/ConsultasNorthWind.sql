Use Northwind
/*Barraza Lugo Francisco Antonio*/

-----------------------NORTHWIND-------------------------------------
select * from Orders 
--1.- Mostrar una relacion de productos con su categoria.

Select p.ProductName as Nombre,c.CategoryName as Categoria from Products p Inner Join Categories c on
p.CategoryID=c.CategoryID 
Order by Nombre asc 

--2.-Cuantos empleados se tienen por departamento.


Select r.RegionDescription as Departamento,count(*) as NumeroDeEmpleados from Employees e Inner Join EmployeeTerritories et on
e.EmployeeID=et.EmployeeID Inner Join Territories t on t.TerritoryID=et.TerritoryID 
Inner Join Region r on r.RegionID=t.RegionID 
Group by r.RegionDescription

--3.- Mostrar cuantos productos se tienen por categoria.


Select c.CategoryName as Categoria,count(*) as NumeroDeProductos from Products p Inner Join Categories c on
p.CategoryID=c.CategoryID 
group by c.CategoryName
order by NumeroDeProductos asc

-- 4.-Mostrar el nombre de los proveedores y de los productos que surten.


Select su.ContactName as Proveedor ,p.ProductName as Producto from Suppliers su Inner Join Products p on
su.SupplierID=p.SupplierID 
order by Proveedor asc


-- 5.-Mostrar los productos que mas se vendieron durante un año especifico.


Select top 10 p.ProductName,sum(od.Quantity) as cantidad from Products p Inner Join [Order Details] od on
p.ProductID=od.ProductID Inner Join Orders o on o.OrderID=od.OrderID where o.OrderDate BETWEEN'1997-01-01' AND '1997-31-12'
group by p.ProductName
order by Cantidad desc


-- 6.-Mostrar las ordenes , clientes y vendedores que participaron en la orden.

Select Orders.OrderID as Orden,Customers.ContactName as Cliente,Employees.FirstName as Vendedor from Orders Inner join Customers on
Customers.CustomerID=Orders.CustomerID Inner Join Employees on Employees.EmployeeID=Orders.EmployeeID
order by Cliente



-- 7.-Mostrar el nombre de los clientes que no realizaron compras durante el año determinado.

 select distinct Customers.ContactName as Cliente from Customers Inner Join Orders on 
 Customers.CustomerID=Orders.CustomerID where Orders.CustomerID not in
 (Select Orders.CustomerID from Orders  where Orders.OrderDate BETWEEN '1997-01-01' AND '1997-31-12')
-- 8.- mostrar una relacion de empleados con sus jefes.

select  Employees.FirstName as [Nombre Empleado],Employees.ReportsTo as [Jefesito] from Employees 

-- 9.-Cuantos empleados se tienen en la region norte

Select count(*) as [Empleados En la Region Norte] 
from Employees Inner Join EmployeeTerritories 
on EmployeeTerritories.EmployeeID=Employees.EmployeeID 
Inner join Territories 
on Territories.TerritoryID=EmployeeTerritories.TerritoryID 
Inner join Region on Region.RegionID=Territories.RegionID 
where Region.RegionDescription='Northern'

-- 10.-Cuantos empleados se tienen por region 

Select Region.RegionDescription, count(*) as [Empleados En Cada Region] from Employees Inner Join EmployeeTerritories on EmployeeTerritories.EmployeeID=Employees.EmployeeID Inner join Territories on Territories.TerritoryID=
EmployeeTerritories.TerritoryID Inner join Region on Region.RegionID=Territories.RegionID 
group by Region.RegionDescription
Order by count(*) desc

-- 11.-Cual es la cantidad total vendida de cada producto

select Products.ProductName as Nombre,sum([Order Details].Quantity)as [Cantidad total vendida]  from Products Inner Join 
[Order Details] on Products.ProductID=[Order Details].ProductID 
group by Products.ProductName
order by sum([Order Details].Quantity) desc


-- 12.-Cual es es producto que menos se ha vendido. 


Select top 1 p.ProductName as Nombre,sum(od.Quantity) as Cantidad 
from Products p Inner Join [Order Details] od on
p.ProductID=od.ProductID 
group by p.ProductName
order by Cantidad asc


-- 13.-Cual es el monto de ventas realizado por cada empleado.

select  e.FirstName as Empleado , sum(od.Quantity*od.UnitPrice ) 
as [Monto de ventas] from Employees e Inner Join Orders o on
e.EmployeeID=o.EmployeeID Inner Join [Order Details] od on od.OrderID=o.OrderID
group by e.FirstName
-- 14.- Mostrar los empledos que no relizaron ventas.
select e.EmployeeID  Empleado  from Employees e where e.EmployeeID not in 
(select e.EmployeeID from Employees Inner Join Orders o on o.EmployeeID=e.EmployeeID)

-- 15.-Mostrar los clientes cuyo monto anual de compra fue mayor a 5000 (para un año deterinado).
Select c.CustomerID, c.ContactName from Customers c where c.CustomerID in (Select distinct c.CustomerID from Customers c Inner Join Orders o on c.CustomerID=o.CustomerID 
where o.OrderID in(Select od.OrderID from [Order Details] od
group by od.OrderID
having sum(od.Quantity*od.UnitPrice)>5000) and o.OrderDate BETWEEN '1997-01-01' AND '1997-31-12')

-- 16.-Mostrar los vendedores cuyo monto anual de venta fue menor a 3000 para un año determinado.
Select e.FirstName as [Vendedores]   from Employees e where e.EmployeeID in (select e.EmployeeID from Employees e Inner Join Orders o on 
o.EmployeeID=e.EmployeeID where o.OrderID in(select od.OrderID from [Order Details] od 
group by od.OrderID
having sum(od.Quantity*od.UnitPrice)<3000 ) and o.OrderDate BETWEEN '1997-01-01' AND '1997-31-12')

-- 17.-Muestre una relacion de total de ventas por vendedor 

Select e.EmployeeID,e.FirstName as [Vendedores] ,sum(od.Quantity*od.UnitPrice) as Ventas   from Employees  e Inner Join Orders o on 
o.EmployeeID=e.EmployeeID Inner Join [Order Details] od on od.OrderID=o.OrderID where e.Title='Sales Representative'
group by e.EmployeeID,e.FirstName
order by Ventas  asc


-- 18.-Mostrar las categorias que tienen mas productos relacionados
Select top 3 with ties ca.CategoryName as Categorias,count(*) as [Numero De Productos]   from Categories ca Inner Join Products p on
ca.CategoryID=p.CategoryID
group by ca.CategoryName
order by [Numero De Productos] desc

-- 19.-Mostrar que productos no se vendieron durante un año determinado
Select p.ProductName as Producto from Products p where p.ProductID not in(Select od.ProductID from [Order Details] od Inner Join Orders o on
o.OrderID=od.OrderID where o.OrderDate BETWEEN '1996-01-01' AND '1996-31-12')

-- 20.-Mostrar el departamento con menos empleados.
Select top 1 Region.RegionDescription, count(*) as [Empleados] 
from Employees Inner Join EmployeeTerritories on EmployeeTerritories.EmployeeID=Employees.EmployeeID Inner join Territories on Territories.TerritoryID=
EmployeeTerritories.TerritoryID Inner join Region on Region.RegionID=Territories.RegionID 
group by Region.RegionDescription
Order by [Empleados] asc

-- 21.-Mostrar los productos que menos se venden. 
Select top 5 p.ProductName as Productos ,sum(od.Quantity) as Cantidad from Products p Inner Join [Order Details] od on
od.ProductID=p.ProductID 
group by p.ProductName
order by cantidad asc


