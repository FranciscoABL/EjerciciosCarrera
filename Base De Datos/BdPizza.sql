
CREATE DATABASE BdPizza
USE BdPizza
--Eliminacion de tablas
DROP DATABASE BdPizza
 
--Creacion de tablas
CREATE TABLE Pizzas (
Cve_pizza varchar(10) not null primary key,
Pizza varchar(50) not null,
Num_ingredientes int not null,
)
CREATE TABLE Pizzerias (
Cve_pizzeria varchar(10) not null primary key,
nombre varchar(50) not null,
Localizacion varchar(50) not null,
)
CREATE TABLE Sirven (
Cve_pizzeria varchar(10) not null,
Cve_pizza varchar(10) not null,
constraint pk_Sirven primary key(Cve_Pizzeria,Cve_pizza),
constraint fk_pizzeria foreign key(Cve_Pizzeria)references Pizzerias(Cve_pizzeria),
constraint fk_pizzas foreign key(Cve_pizza)references Pizzas(Cve_pizza),
)
CREATE TABLE Clientes (
Cve_cte varchar(10) not null primary key,
Nombre varchar(50),
Edad int not null,
)
CREATE TABLE Comen(
Cve_cte varchar(10) not null,
Cve_Pizzas varchar(10) not null,
constraint pk_come primary key(Cve_cte,Cve_Pizzas),
constraint fk_cliente foreign key(Cve_cte)references Clientes(Cve_cte),
constraint fk_clientepizzas foreign key(Cve_Pizzas)references Pizzas(Cve_pizza),
)

--Insertar
INSERT Pizzas VALUES	( 
	'P1'	,'Champi�ones',	5
);
INSERT Pizzas VALUES	( 
	'P2'	,'Quesos',	7
);
INSERT Pizzas VALUES	( 
	'P3'	,'Sinaloense',	4
);
INSERT Pizzas VALUES	( 
	'P4'	,'Dieta',	8
);
INSERT Pizzas VALUES	( 
	'P5'	,'Mozarella',	8
);
INSERT Pizzas VALUES	( 
	'P6'	,'Tres marias',	5
);

--
INSERT Pizzerias VALUES	( 
	'A'	,'Fabula',	'Culiacan'
);
INSERT Pizzerias VALUES	( 
	'B'	,'Pizzeta',	'Mazatlan'
);
INSERT Pizzerias VALUES	( 
	'C'	,'Dominos',	'Culiacan'
);
INSERT Pizzerias VALUES	( 
	'D'	,'Dominator',	'Culiacan'
);
--
INSERT Sirven VALUES	( 
	'A'	,'P1'
);
INSERT Sirven VALUES	( 
	'A'	,'P3'
);
INSERT Sirven VALUES	( 
	'B'	,'P5'
);
INSERT Sirven VALUES	( 
	'B'	,'P3'
);
INSERT Sirven VALUES	( 
	'C'	,'P2'
);
INSERT Sirven VALUES	( 
	'D'	,'P6'
);
INSERT Sirven VALUES	( 
	'D'	,'P5'
);
--
INSERT Clientes VALUES	( 
	'C1'	,'Juan',18
);
INSERT Clientes VALUES	( 
	'C2'	,'Rosa',17
);
INSERT Clientes VALUES	( 
	'C3'	,'Pedro',29
);
INSERT Clientes VALUES	( 
	'C4'	,'Tere',16
);
INSERT Clientes VALUES	( 
	'C5'	,'Alma',35
);
INSERT Comen VALUES	
('C1'   ,'P2'),
('C1'   ,'P4'),
('C4'	,'P2'),
('C5'	,'P2'),
('C5'	,'P6'),
('C5'	,'P3'),
('C5'	,'P4'),
('C2'	,'P5'),
('C2'	,'P3'),
('C3'	,'P2');


/*************Consultas*********/
--1.- Nombre de las pizzerias de la ciudad de Culiacan.

	SELECT nombre as Pizzerias
	FROM Pizzerias
	WHERE Localizacion='Culiacan'


--2.- Nombre de las pizzer�as que sirven mas de dos pizzas.

	SELECT nombre as Pizzerias
	from Pizzerias INNER JOIN Sirven on 
	Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
	group by nombre
	Having count(*)>=2
--3.Nombre de los clientes que comen mas de 3 pizzas.

	SELECT Nombre as Clientes
	FROM Clientes inner join Comen on 
	Clientes.Cve_cte=Comen.Cve_cte inner join
	Pizzas on Pizzas.Cve_pizza=Comen.Cve_Pizzas
	group by nombre
	Having count(*)>=3
--4.Nombre de las pizzas y el nombre de las pizzer�as donde se sirven.

SELECT Pizza as Pizzas, nombre as Pizzerias FROM Pizzerias inner join Sirven on 
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria inner join
Pizzas on Pizzas.Cve_pizza=Sirven.Cve_pizza 
Order by Pizzas asc
--5.Nombre de las pizzer�as que sirven pizzas con mas de 3 ingredientes.
SELECT  distinct Pizzerias.nombre as Pizzerias FROM Pizzerias inner join Sirven on 
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria inner join
Pizzas on Pizzas.Cve_pizza=Sirven.Cve_pizza 
where Pizzas.Num_ingredientes>=3
--6.- Nombre de los clientes mayores que 18 a�os que comen pizzas de mozarella.
SELECT Nombre as Clientes FROM Clientes where Clientes.Cve_cte in
         (SELECT Comen.Cve_cte FROM Comen where Comen.Cve_Pizzas in
                   (SELECT Pizzas.Cve_pizza FROM Pizzas where Pizzas.Pizza='Mozarella' and Clientes.Edad>=18 ))
--7.Nombre de las pizza que no come ning�n cliente
SELECT Pizza as  [Nombre De Pizza] 
FROM Pizzas where Pizzas.Cve_pizza
not in (SELECT Comen.Cve_Pizzas FROM Comen where Comen.Cve_cte  in(
SELECT Clientes.Cve_cte FROM Clientes))
--8.mostrar una relaci�n de pizzer�as con el n�mero de pizzas que sirve.
SELECT Sirven.Cve_pizzeria as  [Nombre De Pizzeria]  ,count(*) as[Numeros de Pizza Que sirven]
FROM Sirven where Sirven.Cve_pizzeria in (SELECT Pizzerias.Cve_pizzeria FROM Pizzerias)
Group by Sirven.Cve_pizzeria

SELECT Pizzerias.nombre as [Nombre De Pizzeria] , count(*) as[Numeros de Pizza Que sirven] 
FROM Pizzerias Inner Join Sirven on
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
Group by Pizzerias.nombre
--9.Mostrar una relaci�n de clientes con el n�mero de pizzas que consume
SELECT Clientes.Nombre as Nombre_De_Cliente , count(*) as[Numeros de Pizza Que Consume] 
FROM Clientes Inner Join Comen on
Clientes.Cve_cte=Comen.Cve_cte
Group by Clientes.Nombre
Order by [Numeros de Pizza Que Consume] asc 
--10.nombre del cliente que mas pizzas consume (autoestudio: estudiar el TOP)
SELECT top 1 With ties clientes.Nombre  As [Nombre del Cliente con mas pizzas] FROM Clientes Inner Join Comen
on Clientes.Cve_cte=Comen.Cve_cte 
Group by Clientes.Nombre
Order by count(*) desc
--11.Nombre del cliente que menos pizzas consume (autoestudio: estudiar el TOP)
SELECT top 1 With ties clientes.Nombre As [Nombre del Cliente con menos pizzas] FROM Clientes Inner Join Comen
on Clientes.Cve_cte=Comen.Cve_cte 
Group by Clientes.Nombre
Order by count(*) asc
--12.Mostrar la edad promedio de las personas que consumen pizzas de dieta.
SELECT Avg(Edad) as EdadPromedio FROM Clientes Inner Join Comen
on Clientes.Cve_cte=Comen.Cve_cte Inner Join Pizzas on
Pizzas.Cve_pizza=Comen.Cve_Pizzas
where Pizza='Dieta'
--13.mostrar la pizzer�a que menos pizzas sirve
SELECT top 1 Pizzerias.nombre as Nombre_De_Pizzerias , count(*) as[Numeros de Pizza Que sirven] 
FROM Pizzerias Inner Join Sirven on
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
Group by Pizzerias.nombre
Order by count(*) asc
--14.mostrar la pizzer�a que mas pizzas sirve.
SELECT top 1 With Ties Pizzerias.nombre as [Nombre De las Pizzerias]  , count(*) as[Numeros de Pizza Que sirven] 
FROM Pizzerias Inner Join Sirven on
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
Group by Pizzerias.nombre
Order by [Numeros de Pizza Que sirven]  desc
--15.Mostrar el nombre de la pizza que no se sirve en ninguna pizzer�a.
SELECT Pizza as Nombre_De_Pizza 
FROM Pizzas where Pizzas.Cve_pizza
not in (SELECT Sirven.Cve_pizza FROM Sirven )
group by Pizzas.Pizza
--16.Mostrar la ciudad que tiene mas de dos pizzer�as.
SELECT Pizzerias.Localizacion as [Ciudad Que tiene mas de dos Pizzerias] , count(*) as[Numeros de Pizzerias] 
FROM Pizzerias
Group by Pizzerias.Localizacion
Having count(*)>=2
--17.Mostrar el nombre de las pizzer�as que se encuentran en la ciudad que tiene mas de dos pizzer�as.
SELECT nombre , count(*) as[Numeros de Pizzerias] 
FROM Pizzerias Inner Join Sirven on(
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria)
Group by nombre
Having count(*)>=2
--Borrado de datos:
--1.- Borra los clientes que no consumen pizzas.
delete FROM Clientes where Clientes.Cve_cte
not in (SELECT Comen.Cve_cte FROM Comen  )
--2.Elimina las pizzas que no se sirven en ninguna pizzer�a.
alter TABLE Sirven drop constraint fk_pizzas
alter TABLE Comen drop constraint fk_clientepizzas
delete FROM Pizzas where Pizzas.Cve_pizza
not in (SELECT Sirven.Cve_pizza FROM Sirven )
SELECT * FROM Pizzas
--3.Eliminas los clientes menores de 19 a�os, que sucede
delete FROM Clientes where Clientes.Edad<=19
alter TABLE Comen drop constraint fk_cliente
SELECT * FROM Clientes
--4. Elimina las pizas de la ciudad de culiacan:
delete FROM Pizzerias where Localizacion='Culiacan'
alter TABLE Sirven drop constraint fk_pizzeria



--1.- Formula cinco consultas diferentes a las planteadas anteriormente e 
--inserta nuevos datos para el correcto funcionamiento de tus consultas.
-- Obligatorio insertar nuevos datos. 

INSERT Pizzas VALUES	( 
	'P7'	,'Pi�a',	5
);

INSERT Pizzerias VALUES	( 
	'E'	,'ElPerron',	'Culiacan'
);
INSERT Sirven VALUES	( 
	'E'	,'P7'
);

INSERT Clientes VALUES	( 
	'C6'	,'Paco',18
);
INSERT Comen VALUES	
('C6'   ,'P7'),
('C6'   ,'P4');

--1. Se a a�adido una piza nueva quien es el que la come
Select c.Nombre FROM Clientes c Inner Join Comen co on
c.Cve_cte=co.Cve_cte Inner Join Pizzas piz on piz.Cve_pizza=co.Cve_Pizzas where piz.Pizza='Pizza'
--2 Nombre de las pizzas con mas ingredientes
Select top 1 with ties piz.Pizza as Nombre,piz.Num_ingredientes as Numero from Pizzas piz
Order by piz.Num_ingredientes desc
--3.- Pizzerias que empiezen con 'Do'
select p.nombre as Nombre
  from Pizzerias p
 where Nombre like 'Do%' 
--4. Clientes que tengas una a en su nombre
select Clientes.Nombre
  from Clientes
 where Clientes.nombre like '%a%' 
 --5.-Cuantos clientes hay entre 18 y 40 a�os y quienes son
 Select  count(*) as Numero from Clientes where Clientes.Edad between 18 and 40

 Select Clientes.Nombre as Nombres from Clientes where Clientes.Edad between 18 and 40
