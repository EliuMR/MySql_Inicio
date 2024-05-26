-- SQL Union
-- cuando usamos union estamos combinando los result de dos o más sentencias select en un único result set
-- regresa el mismo número de columna
-- el uso de union da por resultado renglones distintos es decir elimina duplicados, si queires
-- que salgan todos deve usarse all

-- select_statment1
-- union [ALL]
-- select_statment2
-- [Union [ALL]]
-- select_statment3...
-- [order by order_by_list]

use bdPendiente;
drop table if exists bdpendiente.clientes;

create table bdPendiente.clientes(
	id int not null auto_increment,
    apaterno varchar(45) null,
    amaterno varchar(45) null,
    nombre varchar(45) null,
    correo varchar(45) null,
    telefono varchar(45) null,
	calle varchar(45) null,
    numero varchar(45) null,
    colonia varchar(45) null,
    municipio varchar(45) null,
    primary key (id)
)engine InnoDB;

-- vamos a cargar unos archivos para el ejercicio
show variables like "securete_file_priv";
-- linux
load data infile '/var/lib/mysql-files/listadoclientes.csv'
into table clientes character set latin1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n' ignore 1 rows;

-- windows
load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\listadoclientes.csv'
into table clientes character set latin1
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n' ignore 1 rows;


-- realizar una sentencia unión de la tabla de personas en la cual solo se ocupara el id,
-- nombre, correo y telefono
-- forma los mismo campos de la tabla clientes para mostrar cómo unitlas por medio de la instrucción Union
select * from clientes;
select * from personas;

select id, nombre, correo, telefono from personas
union all
select id, concat(apaterno,' ', amaterno,' ',nombre) as "nombre" ,correo,telefono from clientes -- concatenamos para que los campos coincidan
order by id;

-- realiza una isntrucción unión de la misma tabla, en este caso tabla clientes, por un lato 
-- la primer instrucción union tendrá como objetivo sacar una lista de las personas con apellido Perex
-- por otro lado sacará la lista de las personas que tengan por lada diferente
-- los digitos 340 
select * from clientes
where apaterno="PEREZ"
union all
select * from clientes 
where left(telefono,3)<>"340";