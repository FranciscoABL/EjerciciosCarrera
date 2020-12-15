use MoviesDB

/*
Base de datos MoviesDB
Barraza Lugo Francisco
*/

--Crear Base de datos si no existe
CREATE DATABASE MoviesDB

--Eliminar tablas
DROP TABLE Movie
DROP TABLE Reviewer
DROP TABLE Rating

/*
	There is a movie with ID number mID, a title, a release year, and a director.
*/

CREATE TABLE Movie  (
    mID INT NOT NULL PRIMARY KEY,
    title CHAR(30) NOT NULL,
    year INT NOT NULL	CONSTRAINT YEAR_NOT_VALID check( year > 1900	AND	year < 2014 ),
    director CHAR(30) NULL
);

-- Llenar tabla Movie-
INSERT Movie VALUES	( 
	101, 'Gone with the Wind', 1939, 'Victor Fleming'
);
INSERT Movie VALUES	( 
	102, 'Star Wars', 1977, 'George Lucas'
);
INSERT Movie VALUES	( 
	103,'The sound of music',1965,'Robert Wise'
);
INSERT Movie VALUES	( 
	104,'ET',1982,'Steven Spielberg'
);
INSERT Movie VALUES	( 
	105,'Titanic',1997,'James Cameron'
);
INSERT Movie VALUES	( 
	106,'Snow white',1937,NULL
);
INSERT Movie VALUES	( 
	107,'Avatar',2009,'James Cameron'
);
INSERT Movie VALUES	( 
	108,'Raiders of the Lost Ark',1981,'Steven Spielberg'
);


/*
	The reviewer with ID number rID has a certain name.
*/
CREATE TABLE Reviewer   (
    rID INT NOT NULL PRIMARY KEY,
    name CHAR(30) NOT NULL
);

-- llenar tabla reviewer
INSERT Reviewer VALUES	( 
	201,'Sarah Martinez'
);
INSERT Reviewer VALUES	( 
	202,'Daniel Lewis'
);
INSERT Reviewer VALUES	( 
	203,'Britanny Harrys'
);
INSERT Reviewer VALUES	( 
	204,'Mike Anderson'
);
INSERT Reviewer VALUES	( 
	205,'Chris Jackson'
);
INSERT Reviewer VALUES	( 
	206,'Elizabeth Thomas'
);
INSERT Reviewer VALUES	( 
	207,'James Cameron'
);
INSERT Reviewer VALUES	( 
	208,'Ashley White'
);


/*
	The reviewer rID gave the movie mID a number of stars rating (1-5) on a certain ratingDate.
*/
CREATE TABLE Rating (
    rID INT NOT NULL references reviewer(rID),
    mID INT NOT NULL references movie(mID),
    stars INT NOT NULL	CONSTRAINT STARS_MUST_BE_BETWEEN_1_AND_5 CHECK( stars > 0	AND	stars < 6 ),
    ratingDate DATETIME NULL
);

-- llenando la tabla rating
Set DateFormat MDY --indicates the general format is Month Day Year

INSERT Rating VALUES	(
	201,101,2,'2011-01-22'
);
INSERT Rating VALUES	(
	201,101,4,'2011-01-27'
);
INSERT Rating VALUES	(
	202,106,4,NULL
);
INSERT Rating VALUES	(
	203,103,2,'2011-01-20'
);
INSERT Rating VALUES	(
	203,108,4,'2011-01-12'
);
INSERT Rating VALUES	(
	203,108,2,'2011-01-30'
);
INSERT Rating VALUES	(
	204,101,3,'2011-01-09'
);
INSERT Rating VALUES	(
	205,103,3,'2011-01-27'
);
INSERT Rating VALUES	(
	205,104,2,'2011-01-22'
);
INSERT Rating VALUES	(
	205,108,4,NULL
);
INSERT Rating VALUES	(
	206,107,3,'2011-01-15'
);
INSERT Rating VALUES	(
	206,106,5,'2011-01-19'
);
INSERT Rating VALUES	(
	207,107,5,'2011-01-20'
);
INSERT Rating VALUES	(
	208,104,3,'2011-01-02'
);

/*---------------Consultas-----------------*/
/*Select Basicos*/
--1.  Encontrar los títulos de todas las películas dirigidas por Steven Spielberg.--
Select title as Titulo from Movie where director='Steven Spielberg'
--2. Mostrar todos los años que tienen una película que recibió un rating de 4 o 5, y ordénalo en orden ascendente.
Select Distinct year as Año from Movie Inner Join Rating on Movie.mID=Rating.mID  where stars IN (4,5)  Order By year Asc 
--3.Encuentra los nombres de todos los revisores que evaluaron (rated) la película Gone with the wind.--
Select name as Nombres from Reviewer where rID 
in(select rID from Rating where mID 
in(Select mID from Movie where title='Gone with the wind'))
--4.Para cualquier película donde el revisor es el mismo que el director de la película, 
--regresa el nombre del revisor, el titulo de la película y el numero de estrellas.
Select name as Nombre,title as Titulo,stars as Estrellas from Reviewer,Rating,Movie where Reviewer.rID =Rating.rID And
Rating.mID=Movie.mID And Reviewer.name=Movie.director
--5.Escribe una consulta que regrese la información sobre 
--el rating en un formato mas legible: nombre del revisor, titulo de la película,
-- estrellas, y ratingdate. También, ordena los datos, primero por nombre del revisor, 
--luego por titulo de la película, y al final por numero de estrellas.
Select name as Nombre ,title as Titulo,stars as Estrellas,ratingDate as Fecha from Reviewer,Rating,Movie where Reviewer.rID=Rating.rID
And Rating.mID=Movie.mID Order by name Asc,title Asc,ratingDate Asc,stars Asc
--6.Regresa el nombre de todas las películas y el nombre de los revisores en orden del alfabético 
--(ordenando primero por el nombre del revisor y luego por los títulos que el revisó)
Select Reviewer.name as Nombre,Movie.title as Titulo from Reviewer Inner Join Rating on (Reviewer.rID=Rating.rID)  Inner Join Movie on
Rating.mID=Movie.mID Order By Reviewer.name Asc,Movie.title Asc
--7.Encuentra los títulos de todas las películas que no han sido revisadas por chris Jackson 
Select Distinct Movie.title as Titulo from Movie WHERE Movie.mID not in (Select Rating.mID from Rating where Rating.rID 
in(Select Reviewer.rID from Reviewer where name='Chris Jackson'))
--Subqueries in WHERE, FROM, SELECT--
--10.- Qué películas tienen la evaluación mas pobre
--en nuestra base de datos? : Mostrar los títulos de todas las películas que no tienen rating.--
Select Distinct Movie.title as Titulo from Movie where Movie.mID not in 
(Select Rating.mID from Rating )
--11.- Evaluaciones mas severas: Mostrar el nombre de los revisores, el títulos de la película y 
--el número de estrellas para todas las películas que han recibido el rating menor.
Select Reviewer.name as Revisador,Movie.title as Titulo,Rating.stars as Estrellas from Reviewer Inner Join Rating on 
(Reviewer.rID=Rating.rID)  Inner Join Movie on(
Rating.mID=Movie.mID) where Rating.stars=(select min(Rating.stars) from Rating)
--12.-Conservar la mejor, ignora el resto: por cada película 
--que tenga al menos un rating, encuentre el número de estrellas mayor
--que la película ha recibido. Muestra el titulo de la película y el número de estrellas. 
--Ordenadas por título de la película.
--(Esta consulta la puedes resolver sin agregación).
Select m.title as Titulo ,ra.stars as Estrellas from Movie m Inner Join Rating ra on
m.mID=ra.mID where ra.stars=(Select max(ra.stars) from Rating ra)
order by Titulo asc
----Agregacion
--13.-Calculemos algunas estadísticas: mostrar los títulos de las películas 
--y el promedio ordenado del rating del mas alto al mas bajo

Select M.title as Titulo, avg(stars*1.0) as [Promedio de estrellas]
from Movie M inner join Rating Ra on M.mID = Ra.mID
group by M.title
order by [Promedio de estrellas] desc

-- 14.-Cual es las película mas controversial? :Por cada película, 
--regresa el titulo y el ´rating sreap´, esto es: 
--la diferencia entre el rating mayor y el rating menor que se dio a la película. 
--Ordena el resultado de mayor a menor y luego por el titulo de la película.

Select Movie.title as Titulo, Max(stars)-Min(stars) as [Diferencia De Estrellas]
from Movie  inner join Rating on Movie.mID = Rating.mID
group by Movie.title
order by [Diferencia De Estrellas] desc, Movie.title asc

-- 15.-Usuarios poderosos: Encuentra el nombre de todos los 
--revisores que han hecho tres o mas rating (puntos extras si lo haces sin Having o sin count).

Select name as Nombre, count(*) as [Numero de Ratings realizados]
from Reviewer Re inner join  Rating Ra on Re.rID = Ra.rID
group by name
having count(*)>=3

-- 16.-Directores ocupados: Algunos directores dirigen mas de una película.
-- Por cada director, regresa los títulos de todas las películas 
--dirigidas por el, así como el nombre de l director. Ordena el resultado por nombre del director,
-- luego por el titulo de la película (puntos extras si lo escribes sin count).

select m.director as [Nombre De Director], m.title as Titulo
from Movie m 
where m.director is not  null
order by [Nombre De Director] asc, Titulo asc

select m.director as [Nombre De Director], m.title as Titulo
from Movie m
where m.director in (Select director from Movie group by director having count(*)>=1)
order by [Nombre De Director] ASC, Titulo asc


-- 17.-Mejor en promedio: Encuentra las películas con el promedio del rating mejor. 
--Regresa el titulo de la película, y el promedio del rating.

Select top 1 Movie.title as Titulo, avg(Rating.stars*1.0) as Promedio
From Movie   inner join Rating on Movie.mID = Rating.mID
group by Movie.title
order by Promedio desc

-- 18.Peor en promedio: encuentra las películas que tengan el rating promedio menor.
--Regresa el titulo de las películas y el rating promedio 

Select top 1 Movie.title as Titulo, avg(Rating.stars*1.0) as Promedio
From Movie  inner join Rating on Movie.mID = Rating.mID
group by Movie.title
order by Promedio asc

--NULLS---

-- 19.Algunos revisores no proporcionaron una fecha en su evaluación: Mostrar los nombres de todos los revisores
-- que tienen un rating con un valor NULL para el campo fecha.

Select Re.name as [Nombre De Revisador]
From Reviewer Re inner join Rating Ra on Re.rID = Ra.rID
where Ra.ratingDate is null

-- 20.-Cual es la mejor película de cada director?: Por cada director, regresa su nombre,
-- el titulo de la película que dirigió y que recibió el mayor rating individual.
-- Ignora las películas cuyo director no se especifico en la base de datos. 

Select M.director as Nombre, Max(M.title) as Titulo, Max(Ra.stars) as Ranting
From Movie M inner join Rating Ra on M.mID = Ra.mID
where M.director is not null
group by M.director
order by Ranting desc


-- Data Modification Statements.

-- 22.Tenemos un nuevo evaluador: Agrega el evaluador Roger Ebert a la base de datos con un rID de 209.
--Para verificar, escribe una consulta que regrese el numero de revisores en la base de datos.

Insert into Reviewer(rID,name) values (209,'Roger Ebert')

select count(*)  as [Numero de revisores] from Reviewer

-- 23. Un evaluador generoso y prolifero: Ingresa 5-estrellas de rating para de  
--Roger Ebert para todas las películas en la base de datos. 

Insert into Rating(rID,mID,stars,ratingDate) 
values (209,101,5,getdate()), (209,102,5,getdate()), (209,103,5,getdate()),(209,104,5,getdate()),(209,105,5,getdate()),(209,106,5,getdate()),(209,107,5,getdate()),(209,108,5,getdate())

-- 24.-Actualiza todas las películas que tienen un rating promedio (AVG) de 4 estrellas o mas,
--suma 25 al año de lanzamiento (reléase year). Para verificar realiza una consulta que muestre
--el número de películas pero con el año de liberación antes de 1990. 

Select M.title as Titulo, avg(RA.stars*1.0) as Promedio
From Movie M inner join Rating Ra on M.mID = Ra.mID
group by M.title
order by Promedio desc

select * from Movie

alter table Movie
drop constraint YEAR_NOT_VALID

Update Movie
set year=year+25
where Movie.title in (Select M.title
From Movie M inner join Rating Ra on M.mID = Ra.mID
group by M.title
having AVG(RA.stars*1.0)>=4.0)

select * from Movie where year <=1990

-- 25.Filtrar por década: Elimina todas les películas de la tabla Movie excepto aquellas cuyo 
--año se encuentren en el rango 2000 a 2010. 
--Para verificar, regresa los títulos de todas las películas que quedan en la tabla Movie.

alter table Rating
drop constraint FK__Rating__mID__07F6335A

delete from Movie
where year not between 2000 and 2010

select * from Movie

-- 26.-Uppsss! Ahora muchas de las evaluaciones se refieren a películas que no 
--están en la tabla Movie.Borra todos los ratings que no tengan una correspondencia en la tabla Movie. 
--Para verificar, regresa el numero de ratings que aun quedan en la tabla.

delete from Rating
where Rating.mID not in( select Ra.mID from Movie m inner join Rating ra on m.mID = ra.mID)

select count(*) as [Numero de Ratings] from Rating 

-- 27.-No te necesitamos más: Ahora muchos de los revisores no han realizado  evaluaciones. 
--Elimina todos los revisores que no tienen evaluaciones en la tabla Ratings. 
--Para verificar, regresa el nombre de los evaluadores que aun quedan en la tabla.

delete from Reviewer
where Reviewer.rID not in(select Ra.rID from Reviewer Re inner join Rating Ra on Re.rID = Ra.rID)

select name as Nombre
from Reviewer
