use bdPendiente;

-- copia de la tabla personas
-- no da foreging keys de la tabla original, no tiene integridad referencial
create table tmpPersonas as 
select * from personas;

select * from tmpPersonas;

drop table if exists tmpPersonas;

-- INSERT
-- insert [into] nombre_tabla[lista_columnas]
-- values (expresion1[,expresion2]...)

-- Creamos una copia sin los valores
create table tmpPersonas as 
select * from personas
where id=-1;


-- insertamos un registro sin usar la lista de las columnas
-- recordad que no tiene primary key mucho menos es autoincrementable
insert into tmpPersonas
values(0,'Jaime','jaime@gmail.com','1234567891');

-- insertamos el mismo renglón en la tabla de personas pero sin utilizar
-- nombre de columnas en la sintaxis
insert into Personas
values(0,'Jaime','jaime@gmail.com','1234567891');

-- hacemos la insercción de un resgistro para la tabla usuarios 
-- haciendo uso de los nombres de las columnas
-- inserta con el dato agregado de la persona anterior 
-- sino no se cumple la integridad referencial
insert into usuarios(nombre, pasword, idPersona)
values('Pedro', 'Admin12',12);

-- hacemos un insert multiple con varios registros en una misma intrución 
insert into tmpPersonas values
(1,'Juan', 'juan@gmail.com', '22225496836'),
(2,'Alan', 'ju64n@gmail.com', '22456465436'),
(3,'Luz', 'j546n@gmail.com', '546456665636');

-- insertar todos los registros de la tabla personas hacia la tabla tmpPersonas
-- pero solo los que tengan correo hotmail
create table tmpPersonas as 
select * from personas
where correo like '%hotmail%';
select * from tmpPersonas;