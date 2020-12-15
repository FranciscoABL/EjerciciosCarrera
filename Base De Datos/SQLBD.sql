create DATABASE SITIO_WEB
go
use SITIO_WEB
go 

create table CINES
(
 cine_nombre char (20) not null PRIMARY KEY,
 cine_direccion varchar(40),
 cine_telefono varchar(20)
)
create table PELICULAS
(
 peli_id int not null PRIMARY KEY,
 peli_clasificacion varchar(20),
 peli_duracion varchar (15),
 peli_directores char (30),
 peli_reparto char (30),
 peli_año_prod varchar (20),
 peli_pais_origen varchar (20),
 peli_genero varchar (20),
 peli_idioma char (20),
 peli_titulo_dis varchar (30),
 peli_URL varchar(50),
 cine_nombre char (20) FOREIGN KEY REFERENCES CINES (cine_nombre)
 )
 create table DIRECTORES_ACTORES
 (
  dirAct_nombre char(30) not null PRIMARY KEY,
  dirAct_nacionalidad char(20)
 )
 create table ASIGNACION
 (
  pelicula_id int,
  dirActor_nombre char(30),
  Constraint FKpelicula_id FOREIGN KEY (pelicula_id) REFERENCES PELICULAS(peli_id),
  Constraint FKactor FOREIGN KEY (dirActor_nombre) REFERENCES DIRECTORES_ACTORES(dirAct_nombre),
  Constraint PKactores PRIMARY KEY (pelicula_id,dirActor_nombre)
  )
  create table SALAS
  (
  sala_id varchar(15) not null PRIMARY KEY,
  sala_nombre char(40),
  sala_numero_butaca int,
   cine_nombre char (20) FOREIGN KEY REFERENCES CINES (cine_nombre)
   )
  


  --Insert Cines
  Insert into CINES values( 'Cinemex','Culiacan','6612121212'),( 'Cinepolis','Culiacan','6621121212'),( 'CityCinemas','Culiacan','6613131313')
  --Insert Peliculas
  Insert into PELICULAS values( 1,'B','2 hr','El Chuy','Ahi le pones tu','2018','Eua ','Terror','Español','La Monja','12','Cinemex'),
  ( 2,'B','1:30 hr','El Chuy','Ahi le pones tu','2018','Eua ','Terror','Español','La Monja Regresa','12','Cinepolis'),
  ( 3,'B','2 hr','El Chuy','Ahi le pones tu','2018','Eua ','Terror','Español','Viernes 13','12','CityCinemas')
  --Insert Directores Actores
   Insert into DIRECTORES_ACTORES values('El Padrino','Mexico'),('Bastidios','Mexico')
   --Insert asignacion
   --Aqui agregue dos actores a la pelicula 1 si quieres agregarle otro pues dale otro insert
   Insert into ASIGNACION values(1,'El Padrino'),(1,'Bastidios')
--Insert salas
--Ya aqui las salas pues le pones mas nose
Insert into SALAS values('1','1A',14,'Cinepolis'),('2','1A',14,'Cinepolis')



--Select 
Select dirAct_nombre as [Directores] ,peli_id as [Clave De Pelicula] from DIRECTORES_ACTORES Inner Join ASIGNACION on
DIRECTORES_ACTORES.dirAct_nombre=ASIGNACION.dirActor_nombre Inner Join PELICULAS on ASIGNACION.pelicula_id=PELICULAS.peli_id