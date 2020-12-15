--Equipo
/*Aguirre Castro Andres
  Barraza Lugo Francisco Antonio
  Diaz Villegas Francisco Javier
*/
Use Prueba
Go
--Creacion De Cities con el ejemplo de las diapositivas
	Create view  vw_cities as 
	Select C.CityID,C.CityName,C.RegionID,RE.RegionName,RE.CountryID,CO.CountryName 
	From Cities C 
	Inner join Regions  RE on RE.RegionID=C.RegionID
	Inner join Countries CO on CO.CountryID=RE.CountryID
	Go

	--creacion de vista clientes con cities
	Create view Clientes as
	Select c.CustomerID,NOMBRE_CLIENTE =c.CompanyName,
	CLIENTE_CIUDAD=CC.CityName, CLIENTE_REGION=CC.RegionName,CLIENTE_PAIS=CC.CountryName
	 from Customers c Inner Join vw_cities CC on CC.CityID=c.CityID
	 go
	 --creacion de vista de Empleados con cities
	Create view Empleados as
	Select e.EmployeeID,NOMBRE_Empleado =e.FirstName+' ' +e.LastName,Telefono=e.HomePhone,
	EMPCITY=CE.CityName,EMPREGION=CE.RegionName,EMPCOUNTRY=CE.CountryName
    from Employees e Inner Join vw_cities CE on CE.CityID=e.CityID
	go
	--creacion de vista Jefe con cities
	create view Jefes as
	Select jefe.EmployeeID,NOMBRE_JEFE =jefe.FirstName+' ' +jefe.LastName,Telefono=jefe.HomePhone,
    JEFE_CIUDAD=CI.CityName,JEFE_REGION=CI.RegionName,JEFE_PAIS=CI.CountryName
	from Employees e Left join Employees Jefe on e.ReportsTo=jefe.EmployeeID
	Inner Join vw_cities CI on CI.CityID=jefe.CityID
	go
--Creacion de vista orders para los datos tiempo,Jefes,clientes,Empleados
--Ejemplo de las diapositivas
    Create view vw_Tiempo as 
	Select o.OrderID,o.OrderDate,dia=day(OrderDate),mes=datename(MM,OrderDate),año =year(OrderDate)
	From Orders o 
	Go

--Creacion de una nueva vista para los campos de proveedor ,ya que al generarla en una sola vista todos los campos que
--necesitabamos generaba errores
	Create view vw_Productos_Proveedores as 
	Select p.ProductID,p.ProductName,s.Address,s.ContactName,Proveedor_Ciudad=c.CityName, Proveedor_Region=c.RegionName,Proveedor_Pais=c.CountryName 
	from Products p 
	Inner join Suppliers s on p.SupplierID=s.SupplierID 
	Inner join vw_cities c on s.CityID= c.CityID
	Go

--Creacion de la vista de hecho la cual tendra los calculos
	Create view vw_Detalle as
	Select od.OrderID, productid, unitprice, quantity ,Customers.CustomerID,Employees.EmployeeID,
	Importe_Venta = unitprice *	quantity ,Piezas_Vendidas=sum(Quantity),Clientes_Atendidos=count(distinct Customers.CustomerID) 
	From [Order Details] od 
	Inner Join Orders on Orders.OrderId=od.OrderId Inner Join Customers on Customers.CustomerId=Orders.CustomerID 
	Inner Join Employees on Employees.EmployeeId=Orders.EmployeeID
	Group by od.OrderID,productid, unitprice, quantity,Customers.CustomerID,Employees.EmployeeID
	Go