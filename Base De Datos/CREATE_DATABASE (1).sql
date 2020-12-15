use master
if exists (select * from sysdatabases where name='LIBRARY')
begin
  raiserror('BORRANDO LA BASE DE DATOS LIBRARY...',0,1)
  DROP database LIBRARY
end
go

if exists (select * from sysobjects 
           where type='U' and name='item')
 begin 
 drop table item
 end
go 
if exists (select * from sysobjects 
           where type='U' and name='copy')
 begin 
 drop table copy 
 end
go
if exists (select * from sysobjects 
           where type='U' and name='reservation')
 begin 
 drop table reservation
 end
go
if exists (select * from sysobjects 
           where type='U' and name='loan')
 begin 
 drop table loan 
 end
if exists (select * from sysobjects 
           where type='U' and name='title')
 begin 
 drop table title
 end
go

if exists (select * from sysobjects 
           where type='U' and name='juvenile')
 begin 
 drop table juvenile
 end
go
 if exists (select * from sysobjects 
           where type='U' and name='adult')
 begin 
 drop table adult
 end
go
 if exists (select * from sysobjects 
           where type='U' and name='member')
 begin 
 drop table member
 end
GO

CREATE DATABASE LIBRARY
ON PRIMARY
( NAME = LIB_DAT_PRIM,
   FILENAME = 'c:\program files\microsoft sql server\mssql\data\LIBRARYPRIM01.mdf',
   SIZE = 1,
   MAXSIZE = 2,
   FILEGROWTH = 10% ),
( NAME = LIB_DAT_SEC,
   FILENAME = 'c:\program files\microsoft sql server\mssql\data\LIBRARYSEC01.ndf',
   SIZE = 1,
   MAXSIZE = 2,
   FILEGROWTH = 15% )
LOG ON
( NAME = 'Sales_log',
   FILENAME = 'c:\program files\microsoft sql server\mssql\data\LIBRARYlog01.ldf',
   SIZE = 1MB,
   MAXSIZE = 2MB,
   FILEGROWTH = 1MB )
go 
/********************************************/
use library
/*exec sp_droptype member_no
exec sp_droptype title
exec sp_droptype title_no
exec sp_droptype isbn
exec sp_droptype zipcode*/
go
execute sp_addtype member_no ,'INT' ,'NOT NULL'
execute sp_addtype title  ,'varchar(20)' ,'NOT NULL'
execute sp_addtype title_no  ,'INT' ,'NOT NULL'
EXEC  sp_addtype isbn, 'smallint', 'NOT NULL'
EXEC  sp_addtype zipcode, 'char(10)'
go
/*****************************/

use library

create table member
(
member_no member_no primary key,
lastname char(20) not null,
middleinitial char(1)
)

create table adult
(
member_no member_no primary key references member(member_no),
street char(20) not null,
zipcode zipcode check (zipcode like '[0-9][0-9][0-9][0-9][0-9]'),
city char(20),
state char(20),
phone_no char(20)
)

create table juvenile
(member_no member_no primary key references member(member_no),
 adult_member_no member_no references adult(member_no),
 birthdate datetime not null
)

create table title
(
title_no title_no primary key,
title title not null,
author char(20) not null,
synopsis text 
)


CREATE TABLE item 
(
 isbn isbn PRIMARY KEY,
 title_no title_no references title(title_no),
 idioma VARCHAR(20) NOT NULL,
 cover VARCHAR(20) NULL,
 loanable char(2)
)

CREATE TABLE COPY 
(
isbn isbn,
copy_no int not null,
title_no title_no references title(title_no),
on_loan char (2),
primary key (isbn,copy_no)
)

CREATE TABLE loan 
(
isbn isbn, 
copy_no int not null,
title_no int not null references title(title_no),
member_no int not null references member(member_no),
out_date datetime not null,
due_date datetime not null,
primary key (isbn, copy_no, out_date),
foreign key (isbn, copy_no) references copy (isbn, copy_no)
)

create table reservation
(
isbn isbn references item(isbn),
member_no member_no references member(member_no),
log_date datetime,
remarks varchar(100)
primary key (isbn, member_no)
)


