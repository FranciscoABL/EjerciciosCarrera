
create database BdPizza
use BdPizza
--Eliminacion de tablas
drop database BdPizza
 
--Creacion de tablas
create table Pizzas (
Cve_pizza varchar(10) not null primary key,
Pizza varchar(50) not null,
Num_ingredientes int not null,
)
create table Pizzerias (
Cve_pizzeria varchar(10) not null primary key,
nombre varchar(50) not null,
Localizaciòn varchar(50) not null,
)
create table Sirven (
Cve_pizzeria varchar(10) not null,
Cve_pizza varchar(10) not null,
constraint pk_Sirven primary key(Cve_Pizzeria,Cve_pizza),
constraint fk_pizzeria foreign key(Cve_Pizzeria)references Pizzerias(Cve_pizzeria),
constraint fk_pizzas foreign key(Cve_pizza)references Pizzas(Cve_pizza),
)
create table Clientes (
Cve_cte varchar(10) not null primary key,
Nombre varchar(50),
Edad int not null,
)
create table Comen(
Cve_cte varchar(10) not null,
Cve_Pizzas varchar(10) not null,
constraint pk_come primary key(Cve_cte,Cve_Pizzas),
constraint fk_cliente foreign key(Cve_cte)references Clientes(Cve_cte),
constraint fk_clientepizzas foreign key(Cve_Pizzas)references Pizzas(Cve_pizza),
)

--Insertar
INSERT Pizzas VALUES	( 
	'P1'	,'Champiñones',	5
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
--1.- Nombre de las pizzerías de la ciudad de Culiacán.
select nombre as Pizzerias from Pizzerias where Localizaciòn='Culiacan'
--2.- Nombre de las pizzerías que sirven mas de dos pizzas.
select nombre as Pizzerias from Pizzerias inner join Sirven on 
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria 
group by nombre
Having count(*)>=2
--3.Nombre de los clientes que comen mas de 3 pizzas.
select Nombre as Clientes from Clientes inner join Comen on 
Clientes.Cve_cte=Comen.Cve_cte inner join
Pizzas on Pizzas.Cve_pizza=Comen.Cve_Pizzas
group by nombre
Having count(*)>=3
--4.Nombre de las pizzas y el nombre de las pizzerías donde se sirven.
select Pizza as Pizzas, nombre as Pizzerias from Pizzerias inner join Sirven on 
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria inner join
Pizzas on Pizzas.Cve_pizza=Sirven.Cve_pizza 
Order by Pizzas asc
--5.Nombre de las pizzerías que sirven pizzas con mas de 3 ingredientes.
select  distinct Pizzerias.nombre as Pizzerias from Pizzerias inner join Sirven on 
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria inner join
Pizzas on Pizzas.Cve_pizza=Sirven.Cve_pizza 
where Pizzas.Num_ingredientes>=3
--6.- Nombre de los clientes mayores que 18 años que comen pizzas de mozarella.
select Nombre as Clientes from Clientes where Clientes.Cve_cte in
         (Select Comen.Cve_cte from Comen where Comen.Cve_Pizzas in
                   (Select Pizzas.Cve_pizza from Pizzas where Pizzas.Pizza='Mozarella' and Clientes.Edad>=18 ))
--7.Nombre de las pizza que no come ningún cliente
Select Pizza as  [Nombre De Pizza] 
from Pizzas where Pizzas.Cve_pizza
not in (Select Comen.Cve_Pizzas from Comen where Comen.Cve_cte  in(
Select Clientes.Cve_cte from Clientes))
--8.mostrar una relación de pizzerías con el número de pizzas que sirve.
Select Sirven.Cve_pizzeria as  [Nombre De Pizzeria]  ,count(*) as[Numeros de Pizza Que sirven]
from Sirven where Sirven.Cve_pizzeria in (Select Pizzerias.Cve_pizzeria from Pizzerias)
Group by Sirven.Cve_pizzeria

Select Pizzerias.nombre as [Nombre De Pizzeria] , count(*) as[Numeros de Pizza Que sirven] 
from Pizzerias Inner Join Sirven on
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
Group by Pizzerias.nombre
--9.Mostrar una relación de clientes con el número de pizzas que consume
Select Clientes.Nombre as Nombre_De_Cliente , count(*) as[Numeros de Pizza Que Consume] 
from Clientes Inner Join Comen on
Clientes.Cve_cte=Comen.Cve_cte
Group by Clientes.Nombre
Order by [Numeros de Pizza Que Consume] asc 
--10.nombre del cliente que mas pizzas consume (autoestudio: estudiar el TOP)
Select top 1 With ties clientes.Nombre  As [Nombre del Cliente con mas pizzas] from Clientes Inner Join Comen
on Clientes.Cve_cte=Comen.Cve_cte 
Group by Clientes.Nombre
Order by count(*) desc
--11.Nombre del cliente que menos pizzas consume (autoestudio: estudiar el TOP)
Select top 1 With ties clientes.Nombre As [Nombre del Cliente con menos pizzas] from Clientes Inner Join Comen
on Clientes.Cve_cte=Comen.Cve_cte 
Group by Clientes.Nombre
Order by count(*) asc
--12.Mostrar la edad promedio de las personas que consumen pizzas de dieta.
Select Avg(Edad) as EdadPromedio from Clientes Inner Join Comen
on Clientes.Cve_cte=Comen.Cve_cte Inner Join Pizzas on
Pizzas.Cve_pizza=Comen.Cve_Pizzas
where Pizza='Dieta'
--13.mostrar la pizzería que menos pizzas sirve
Select top 1 Pizzerias.nombre as Nombre_De_Pizzerias , count(*) as[Numeros de Pizza Que sirven] 
from Pizzerias Inner Join Sirven on
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
Group by Pizzerias.nombre
Order by count(*) asc
--14.mostrar la pizzería que mas pizzas sirve.
Select top 1 With Ties Pizzerias.nombre as [Nombre De las Pizzerias]  , count(*) as[Numeros de Pizza Que sirven] 
from Pizzerias Inner Join Sirven on
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria
Group by Pizzerias.nombre
Order by [Numeros de Pizza Que sirven]  desc
--15.Mostrar el nombre de la pizza que no se sirve en ninguna pizzería.
Select Pizza as Nombre_De_Pizza 
from Pizzas where Pizzas.Cve_pizza
not in (Select Sirven.Cve_pizza from Sirven )
group by Pizzas.Pizza
--16.Mostrar la ciudad que tiene mas de dos pizzerías.
Select Pizzerias.Localizaciòn as [Ciudad Que tiene mas de dos Pizzerias] , count(*) as[Numeros de Pizzerias] 
from Pizzerias
Group by Pizzerias.Localizaciòn
Having count(*)>=2
--17.Mostrar el nombre de las pizzerías que se encuentran en la ciudad que tiene mas de dos pizzerías.
Select nombre , count(*) as[Numeros de Pizzerias] 
from Pizzerias Inner Join Sirven on(
Pizzerias.Cve_pizzeria=Sirven.Cve_pizzeria)
Group by nombre
Having count(*)>=2
--Borrado de datos:
--1.- Borra los clientes que no consumen pizzas.
delete from Clientes where Clientes.Cve_cte
not in (Select Comen.Cve_cte from Comen  )
--2.Elimina las pizzas que no se sirven en ninguna pizzería.
alter table Sirven drop constraint fk_pizzas
alter table Comen drop constraint fk_clientepizzas
delete from Pizzas where Pizzas.Cve_pizza
not in (Select Sirven.Cve_pizza from Sirven )
select * from Pizzas
--3.Eliminas los clientes menores de 19 años, que sucede
delete from Clientes where Clientes.Edad<=19
alter table Comen drop constraint fk_cliente
Select * from Clientes
--4. Elimina las pizas de la ciudad de culiacan:
delete from Pizzerias where Localizaciòn='Culiacan'
alter table Sirven drop constraint fk_pizzeria



--1.- Formula cinco consultas diferentes a las planteadas anteriormente e 
--inserta nuevos datos para el correcto funcionamiento de tus consultas.
-- Obligatorio insertar nuevos datos. 

INSERT Pizzas VALUES	( 
	'P7'	,'Piña',	5
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

--1. Se a añadido una piza nueva quien es el que la come
Select c.Nombre from Clientes c Inner Join Comen co on
c.Cve_cte=co.Cve_cte Inner Join Pizzas piz on piz.Cve_pizza=co.Cve_Pizzas where piz.Pizza='Piña'
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
 --5.-Cuantos clientes hay entre 18 y 40 años y quienes son
 Select  count(*) as Numero from Clientes where Clientes.Edad between 18 and 40

 Select Clientes.Nombre as Nombres from Clientes where Clientes.Edad between 18 and 40
