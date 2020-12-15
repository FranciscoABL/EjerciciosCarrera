INSERT INTO member VALUES (1, 'ACOSTA', 'A')
INSERT INTO member VALUES (2, 'SANCHEZ', 'S')

-- inserciones en la tabla adultos
INSERT INTO adult (member_no, street, zipcode, city, state, phone_no)
VALUES (1, 'obregon', '90876', 'culiacan','sinaloa', null)

INSERT INTO adult (member_no, street, zipcode, city, state, phone_no)
VALUES (2, 'rubi', '27754', 'los mochis','sinaloa', '927-7654')





--No es posible borrar una columna 
-- si esta se asocia a un constraint
alter table adult drop column  phone_no

--Para borrar la columna es necesario borrar el constraint
-- que se asocia a la columna
alter table adult drop constraint adult_phone_ck

--El agregar una columna con nulos es valido
Alter table adult add Y int null

select * from adult

--No se puede agregar una columna con not nulls a una tabla
--La siguiente instruccion marca error.
Alter table adult add X int not null

--Para agregar una columna con not null a una
--tabla es necesario que la columna tenga un valor por
--default	
Alter table adult add X int not null default 0

select * from adult

--la nueva columna acepta nulos. la opcion with values 
-- obliga que la columna acepte el valor por default

Alter table adult add fax int null default 0 
with values

select * from adult