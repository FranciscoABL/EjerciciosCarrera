


-----------------------NORTHWIND-------------------------------------

--1.- Mostrar una relacion de productos con su categoria.


Select c.CategoryName, p.ProductName
From Categories c inner join Products p on c.CategoryID = p.CategoryID
order by c.CategoryName asc


-- 2.-Cuantos empleados se tienen por departamento.
select * from Employees

select r.RegionID, r.RegionDescription, count (*) [Cantidad de empleados]
from Employees e inner join EmployeeTerritories et on e.EmployeeID = et.EmployeeID inner join Territories t on t.TerritoryID = et.TerritoryID inner join Region r on t.RegionID = r.RegionID
group by r.RegionID, r.RegionDescription

-- 3.- Mostrar cuantos productos se tienen por categoria.

select c.CategoryID,c.CategoryName,count (*) as [Productos pertenecientes a esta categoria]
from Categories c inner join Products p on c.CategoryID = p.CategoryID
group by c.CategoryID,c.CategoryName

-- 4.-Mostrar el nombre de los proveedores y de los productos que surten.

select s.SupplierID, s.CompanyName, p.ProductName
from Suppliers s inner join Products p on s.SupplierID = p.SupplierID
order by SupplierID asc

-- 5.-Mostrar los productos que mas se vendieron durante un año especifico.


Select top 10 p.ProductName, Sum(od.Quantity) as [Cantidad de productos vendidos en dicho año]
From Orders o inner join [Order Details] od on o.OrderID = od.OrderID inner join Products p on p.ProductID = od.ProductID
where o.OrderDate BETWEEN '1997-01-01' AND '1997-31-12'
group by p.ProductName
order by Sum(od.Quantity) desc

-- 6.-Mostrar las ordenes , clientes y vendedores que participaron en la orden.

Select o.OrderID, c.ContactName as Cliente, e.FirstName as Vendedor
From Orders o inner join Customers c on o.CustomerID = c.CustomerID inner join Employees e on e.EmployeeID = o.EmployeeID

-- 7.-Mostrar el nombre de los clientes que no realizaron compras durante el año determinado.

Select distinct c.ContactName as Nombre
From Customers c inner join Orders o on c.CustomerID = o.CustomerID
where c.CustomerID not in (Select CustomerID from Orders where OrderDate BETWEEN '1998-01-01' AND '1998-31-12')


-- 8.- mostrar una relacion de empleados con sus jefes.

Select e.FirstName as Empleado, e.ReportsTo as [Jefe]
From Employees e 


-- 9.-Cuantos empleados se tienen en la region norte
select * from region

Select count (*) as [Numero de empleados en la región norte]
from Employees e inner join EmployeeTerritories et on e.EmployeeID = et.EmployeeID inner join Territories t on t.TerritoryID = et.TerritoryID inner join Region r on t.RegionID = r.RegionID
where r.RegionID in (Select RegionID from Region where RegionDescription = 'Northern') 

-- 10.-Cuantos empleados se tienen por region 

select r.RegionID, r.RegionDescription, count (*) [Cantidad de empleados]
from Employees e inner join EmployeeTerritories et on e.EmployeeID = et.EmployeeID inner join Territories t on t.TerritoryID = et.TerritoryID inner join Region r on t.RegionID = r.RegionID
group by r.RegionID, r.RegionDescription

-- 11.-Cual es la cantidad total vendida de cada producto

Select p.ProductName, sum(od.Quantity) as [Cantidad total vendida de cada producto]
From Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName

-- 12.-Cual es es producto que menos se ha vendido. 

Select top 1 p.ProductName, sum(od.Quantity) as [Cantidad total vendida de cada producto]
From Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName
order by sum(od.Quantity) asc

-- 13.-Cual es el monto de ventas realizado por cada empleado.

Select e.EmployeeID, sum(od.Quantity*od.UnitPrice) as [Monto de venta por empleado]
From Employees e inner join Orders o on e.EmployeeID = o.EmployeeID inner join [Order Details] od on o.OrderID = od.OrderID
group by e.EmployeeID
order by EmployeeID asc

-- 14.- Mostrar los empledos que no relizaron ventas.

Select EmployeeID
from Employees
where EmployeeID not in (Select distinct e.EmployeeID from Employees e inner join Orders o on e.EmployeeID = o.EmployeeID)

-- 15.-Mostrar los clientes cuyo monto anual de compra fue mayor a 5000 (para un año deterinado).

Select c.CustomerID, c.ContactName
From Customers c
where c.CustomerID in (Select distinct c.CustomerID from Customers c inner join orders o on c.CustomerID = o.CustomerID where o.OrderID in 
						(Select OrderID from [Order Details]  group by OrderID having sum(Quantity*UnitPrice)>5000) AND OrderDate BETWEEN '1997-01-01' AND '1997-31-12' )


-- 16.-Mostrar los vendedores cuyo monto anual de venta fue menor a 3000 para un año determinado.

Select e.EmployeeID,e.FirstName
From Employees e
where e.EmployeeID in (Select e.EmployeeID from Employees e inner join orders o on e.EmployeeID = o.EmployeeID inner join [Order Details] od on od.OrderID = o.OrderID
						where  o.OrderDate BETWEEN '1997-01-01' AND '1997-31-12'
						group by e.EmployeeID  having sum(Quantity*UnitPrice)<3000  
						)

-- 17.-Muestre una relacion de total de ventas por vendedor 

Select e.EmployeeID, sum(od.Quantity*od.UnitPrice) as [Monto de venta por empleado]
From Employees e inner join Orders o on e.EmployeeID = o.EmployeeID inner join [Order Details] od on o.OrderID = od.OrderID
where e.Title = 'Sales Representative'
group by e.EmployeeID
order by EmployeeID asc

-- 18.-Mostrar las categorias que tienen mas productos relacionados

Select top 3 c.CategoryName, count(*) as [Numero de Productos por categoria]
From Categories c inner join Products p on c.CategoryID = p.CategoryID
group by c.CategoryName
order by count(*) desc

-- 19.-Mostrar que productos no se vendieron durante un año determinado

Select p.ProductName
From Products p
where p.ProductID not in (Select distinct od.ProductID from [Order Details] od inner join Orders o on od.OrderID = o.OrderID
							where o.OrderDate BETWEEN '1996-01-01' AND '1996-31-12' )


-- 20.-Mostrar el departamento con menos empleados.


-- 21.-Mostrar los productos que menos se venden. 

Select top 5 p.ProductName, sum(od.Quantity) as [Cantidad total vendida de cada producto]
From Products p inner join [Order Details] od on p.ProductID = od.ProductID
group by p.ProductName
order by sum(od.Quantity) asc
