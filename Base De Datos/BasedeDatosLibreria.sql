create database Libreria

use Libreria



Create table adult
(
member_no int not null primary key,
street varchar(30) null,
city varchar(30) null,
state varchar(30) null,
phone_no varchar(30) null,
eaxpr_date date
)

Create table member
(
member_no int not null primary key,
lastname varchar(30) null,
firstname varchar(30)null,
middleinitial varchar(30) null
)

create table juvenile 
(
member_no int not null primary key,
adult_member_no int not null,
birth_date date
)

create table reservation(
isbn int not null primary key,
member_no int not null,
log_date datetime null
)

create table loan(
isbn int not null,
copy_no int not null,
title_no int not null,
member_no int not null,
out_date datetime not null,
due_date datetime not null
)

alter table loan
add constraint PK_loan primary key(isbn,copy_no)


create table loanhist(
isbn int not null,
copy_no int not null,
title_no int not null,
member_no int not null,
due_date datetime null,
in_date datetime null,
fine_assessed varchar(30) null,
fine_paid varchar(30) null,
fine_waived varchar(30) null,
remarks varchar(30) null
)

alter table loanhist
add constraint PK_loanhist primary key(isbn,copy_no)


create table title 
(
title_no int not null primary key,
title varchar(30) null,
author varchar(30) null,
synopsis varchar(30) null
)


create table item (
isbn int not null primary key,
title_no int not null,
translation varchar(30) null,
cover varchar(30) null,
loanable varchar(30) null
)

create table copy (
isbn int not null,
copy_no int not null,
title_no int not null,
on_loan bit null
)

alter table copy
add constraint PK_copy primary key(isbn,copy_no)

alter table adult
add constraint fk_adult1 foreign key (member_no) references member(member_no)

alter table juvenile
add constraint fk_juvenile1 foreign key (member_no) references member(member_no)

alter table juvenile
add constraint fk_juvenile2 foreign key (adult_member_no) references adult(member_no)

alter table reservation 
add constraint fk_reservation1 foreign key (member_no) references member(member_no)

alter table loan
add constraint fk_loan1 foreign key (member_no) references member(member_no)

alter table loan
add constraint fk_loan2 foreign key (title_no) references title(title_no)

alter table reservation 
add constraint fk_reservation2 foreign key (isbn) references item(isbn)

alter table item
add constraint fk_item1 foreign key (title_no) references title(title_no)

alter table loan
add constraint fk_loan299 foreign key (isbn,copy_no) references copy(isbn,copy_no)

alter table loanhist
add constraint fk_loanhist299 foreign key (isbn,copy_no) references copy(isbn,copy_no)


alter table copy
add constraint fk_copy1 foreign key (title_no) references title(title_no)



INSERT INTO member (member_no,firstname,lastname,middleinitial) VALUES  (1,'Yo','Yos','j'),
(2,'Oyente','El','O'),(3,'Francisco','Barraza','A'),(4,'Pedro','Reyes','C'),(5,'Andres','Castro',null),
(6,'Ramon','Gracia','J'),(7,'Daniel','Sauceda','I'), (8,'Gerald','Borbon',null),(9,'Dulce','Gil','C'),
(10,'Giorno','Giovanna','W'),(11,'Karla','Felix','M'),(12,'Efrain','Felix','J'),(13,'Luison','Gonzalez','A'),(14,'Michelle','Gomez', 'A'),(15,'Felipe','Muñiz', 'E')

INSERT INTO adult (member_no,city,eaxpr_date,phone_no,state,street) VALUES (1,NULL,NULL,NULL,NULL,NULL),
(2,NULL,NULL,NULL,NULL,NULL),(4,NULL,NULL,NULL,NULL,NULL),(8,NULL,NULL,NULL,NULL,NULL),(9,NULL,NULL,NULL,NULL,NULL),
(10,NULL,NULL,NULL,NULL,NULL),(11,NULL,NULL,NULL,NULL,NULL),(12,NULL,NULL,NULL,NULL,NULL)

INSERT INTO juvenile (member_no,adult_member_no,birth_date) VALUES  (3,2,NULL),(5,9,NULL),(6,9,NULL),
(7,12,NULL),(13,11,NULL), (14,9,NULL),(15,10,NULL)

INSERT INTO TITLE (title_no,title,author,synopsis) VALUES (1,'La vaca','Tu papa',null),(2,'Uas','El rector pelon',null),
(3,'Luna de Pluton','Dross',null),(4,'Biblia','Apostoles de Jesus',null), (5,'Fisica Cuantica','Chucuan',null),(6,'Winnie Poo','Astolfo',null),
(7,'Consejos para ganar morritas','Adrian Rojas',null)

insert into item (isbn,title_no,loanable,cover,translation) values (1,1,'yes',null,'Ingles'),
(2,1,'yes',null,'Español'),(3,1,'yes',null,'Ruso'),(4,2,'yes',null,'Ingles'),(5,2,'no',null,'Español'),(6,3,'yes',null,'Ingles'),(7,3,'no',null,'Español'),
(8,4,'yes',null,'Ingles'),(9,5,'yes',null,'Ingles'),(10,5,'no',null,'Español'),(11,6,'yes',null,'Ingles'),(12,6,'no',null,'Español')
,(13,7,'yes',null,'Ingles'),(14,7,'no',null,'Español'),(15,7,'yes',null,'Portugues'),(16,7,'no',null,'Ruso')

insert into copy (isbn,copy_no,title_no,on_loan) values (1,1,1,null),(1,2,1,null),(1,3,1,null),(1,4,1,null),(1,5,1,null),
(2,1,1,null),(2,2,1,null),(2,3,1,null),(2,4,1,null),(2,5,1,null),(3,1,1,null),(3,2,1,null),(4,1,2,null),(4,2,2,null),(4,3,2,null),
(5,1,2,null),(5,2,2,null),(6,1,3,null),(6,2,3,null),(6,3,3,null),(7,1,3,null),(8,1,4,null),(9,1,5,null),(10,1,5,null),(10,2,5,null),
(11,1,6,null),(12,1,6,null),(13,1,7,null),(14,1,7,null),(15,1,7,null),(16,1,7,null),(16,2,7,null),(16,3,7,null),(16,4,7,null),(16,5,7,null)

insert into reservation (isbn,member_no,log_date) values (1,1,null),(2,1,null),(3,6,null),(4,11,null),(5,13,null),(6,7,null),(7,7,null)
,(8,7,null),(9,11,null),(10,10,null),(11,3,null),(12,4,null),(13,5,null),(14,5,null),(15,8,null),(16,5,null)

insert into loan (isbn,copy_no,title_no,member_no,out_date,due_date) values (1,1,1,2,'2014-31-05','2014-06-06'),(1,2,1,4,'2015-11-05','2015-15-05'),(1,3,1,6,'2016-31-05','2016-06-06'),(1,4,1,13,'2014-31-10','2014-06-11'),(1,5,1,13,'2014-31-05','2014-06-06'),
(2,1,1,8,'2011-31-05','2011-06-06'),(2,2,1,8,'2012-31-05','2012-06-06'),(2,3,1,10,'2014-02-05','2014-06-05'),(3,2,1,7,'2014-31-05','2014-06-06'),(4,1,2,3,'2014-31-05','2014-06-06'),(4,2,2,4,'2014-31-05','2014-06-06'),(4,3,2,13,'2014-31-05','2014-06-06'),
(5,1,2,11,'2014-31-05','2014-06-06'),(5,2,2,8,'2014-31-05','2014-06-06'),(6,1,3,9,'2014-31-05','2014-06-06'),(6,2,3,2,'2014-31-05','2014-06-06'),(6,3,3,1,'2014-31-05','2014-06-06'),(7,1,3,12,'2014-31-05','2014-06-06'),(8,1,4,10,'2014-31-05','2014-06-06'),(9,1,5,9,'2014-31-05','2014-06-06'),(10,1,5,1,'2014-31-05','2014-06-06'),(10,2,5,6,'2014-31-05','2014-06-06'),
(11,1,6,7,'2014-31-05','2014-06-06'),(12,1,6,10,'2014-31-05','2014-06-06'),(13,1,7,7,'2014-31-05','2014-06-06'),(14,1,7,1,'2014-31-05','2014-06-06'),(15,1,7,1,'2014-31-05','2014-06-06'),(16,1,7,8,'2014-31-05','2014-06-06')

insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (1,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (2,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (3,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (4,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (5,1,1,4,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (6,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (7,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (8,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (9,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (10,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (11,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (12,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (13,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (14,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (15,1,1,3,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (16,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (17,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no,fine_paid) values (18,1,1,5,'10')
insert into loanhist (isbn,copy_no,title_no,member_no) values (2,2,1,5)

select m.firstname + ' '+m.lastname as [Nombre Completo]
from member m inner join juvenile j on m.member_no= j.member_no

select m.firstname+ ' '+m.lastname as [Nombre Completo]
from member m inner join adult a on m.member_no= a.member_no

select distinct m.firstname
from adult a inner join member m
on a.member_no = m.member_no inner join juvenile j on m.member_no = j.adult_member_no
order by m.firstname asc

select member_no, count(*) as [Numero de Prestamos]
from reservation
group by member_no


select  member_no, count(*) as [Cantidad]
from loan
group by member_no
having count(*)>=2


--Mostrar el nombre d los adultso que teien al menos 3 jovenes a su cargo
select firstname
from member
where member_no in (select adult_member_no from juvenile
					group by adult_member_no 
					having count(*)>=3)


--Mostrar el nombre de los jovenes con dos reservaciones de libros en ingles

select m.firstname
from member m inner join juvenile j on m.member_no = j.member_no
where m.member_no in (select member_no from reservation where isbn in  
(select isbn from item where translation = 'Ingles') group by member_no having count(*)>=2)

--Mostrar el nombre de los adultos con jovenes con prestamos vencidos
select distinct m.firstname
from member m inner join loan l on m.member_no = l.member_no  where m.member_no in
 (Select a.member_no from adult a inner join juvenile j on a.member_no= j.adult_member_no) 
 AND due_date<=GETDATE()


 --Nombre de los usuarios que mas han pagado multas
Select top(1) With Ties
 member.firstname as Nombres from member Inner Join 
 loanhist on member.member_no=loanhist.member_no
 group by member.firstname
 Order by COUNT(fine_paid) desc


 

