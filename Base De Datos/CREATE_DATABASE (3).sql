use master
if exists (select * from sysdatabases where name='LIBRARY')
begin
  raiserror('BORRANDO LA BASE DE DATOS LIBRARY...',0,1)
  DROP database LIBRARY2
end
go

CREATE DATABASE LIBRARY2
ON PRIMARY
( NAME = LIB_DAT_PRIM,
   FILENAME = 'c:\program files\microsoft sql server\mssql\data\LIBRARYPRIM02.mdf',
   SIZE = 1,
   MAXSIZE = 2,
   FILEGROWTH = 10% ),
( NAME = LIB_DAT_SEC,
   FILENAME = 'c:\program files\microsoft sql server\mssql\data\LIBRARYSEC02.ndf',
   SIZE = 1,
   MAXSIZE = 2,
   FILEGROWTH = 15% )
LOG ON
( NAME = 'Sales_log',
   FILENAME = 'c:\program files\microsoft sql server\mssql\data\LIBRARYlog02.ldf',
   SIZE = 1MB,
   MAXSIZE = 2MB,
   FILEGROWTH = 1MB )
go 
/********************************************/
use library2
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
EXEC  sp_addtype zipcode, 'char(5)'
go
/*****************************/

use library2

create table member
(
member_no member_no constraint member_pk primary key,
lastname char(20) not null,
middleinitial char(1)
)

create table adult
(
member_no member_no constraint adult_pk primary key,
street char(20) not null,
zipcode zipcode constraint adult_zip_ck 
check (zipcode like '[0-9][0-9][0-9][0-9][0-9]'),
city char(20),
state char(20),
phone_no char(20),
expr_date datetime not null,
constraint adult_fk foreign key (member_no) references member(member_no)
)

alter table adult 
add constraint adult_phone_ck check 
(phone_no like '(667)[1-9][0-9][0-9]-[0-9][0-9][0-9]')

alter table adult drop constraint adult_phone_ck

ALTER TABLE ADULT 
ADD CONSTRAINT adult_phone_ck CHECK 
(phone_no IS NULL OR 
 phone_no LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
 phone_no LIKE
'([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')

create table juvenile
(member_no member_no constraint juvenile_pk primary key,
 adult_member_no member_no  constraint juvenile_fk
 references adult(member_no),
 birthdate datetime not null,
 constraint juvenile_fk2 foreign key(member_no) references member(member_no)
)

ALTER TABLE JUVENILE 
ADD CONSTRAINT JUVENILE_birthdate_CK 
CHECK (birthdate < getdate())


create table title
(
title_no title_no constraint title_pk primary key,
title title not null,
author char(20) not null,
synopsis varchar(100) 
)

CREATE TABLE item 
(
 isbn isbn,
 title_no title_no references title(title_no),
 idioma VARCHAR(20) NOT NULL,
 cover VARCHAR(20) NULL,
 loanable char(2),
 constraint item_pk primary key (isbn)
)

alter table item add constraint item_loanable_ck 
check (loanable ='si' or loanable='no')

alter table item add constraint item_loanable_df 
default 'si' for loanable


CREATE TABLE COPY 
(
isbn isbn,
copy_no int not null,
title_no title_no constraint copy_title_fk references title(title_no),
on_loan char (2) constraint copy_df default 'no'
constraint copy_pk primary key (isbn,copy_no)
)

alter table copy 
add constraint copy_isbn_fk 
foreign key(isbn)  references item(isbn)

CREATE TABLE loan 
(
isbn isbn, 
copy_no int not null,
title_no int not null constraint loan_title_no_fk 
references title(title_no),
member_no int not null constraint loan_member_fk 
references member(member_no),
out_date datetime not null,
due_date datetime not null,
constraint loan_pk primary key (isbn, copy_no,out_date),
constraint loan_isb_copy_fk foreign key (isbn, copy_no) references copy (isbn, copy_no)
)

alter table loan 
add constraint loan_due_out_ck check(due_date>out_date)

create table reservation
(
isbn isbn constraint reservation_fk references item (isbn),
member_no member_no constraint reservation_fk2 references member(member_no),
log_date datetime,
remarks varchar(100),
constraint reservation_pk primary key (isbn)
)

-- se cometió un error al crear la llave primaria.
-- Es necesario eliminarla y crear otra.
alter table reservation 
drop constraint reservation_pk 

-- se crea una nueva llave primaria.
alter table reservation 
add constraint reservation_pk primary key (isbn, member_no)



