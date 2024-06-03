-- creamos una tabla personas1 la cual creará un charset utf8,n4 y collate utf8mb4_As_cs
-- sensitivo a acentos y a mayúsculas


-- podemos  por charset y collate a nivel de columna o tabla
use bdPendienteTemporal1;
create table if not exists personas1(
	id int not null auto_increment ,
    nombre varchar(60) charset utf8mb4 collate utf8mb4_0900_as_cs not null,
    correo varchar(60) null,
    telefono varchar (60) null,
	primary key (id) 
) charset utf8mb4 collate utf8mb4_0900_as_cs
engine=InnoDB;

-- insertamos un registro que contenga mayúsculas y acentos
insert into personas1 values(0,'Wendy Itzel Roldán','wendy@hotmail.com','1234567890');

-- hacemos una consulta buscando el dato del nombre con mayúsculas
select * from personas1
where nombre='WENDY ITZEL ROLDAN';

-- este es el único que detecta
select * from personas1
where nombre='Wendy Itzel Roldán';

select * from personas1
where nombre='Wendy Itzel Roldan';


 -- cambiamos collate
 create table if not exists personas2(
	id int not null auto_increment,
    nombre varchar(60) not null,
    correo varchar(60) null,
    telefono varchar (60) null,
	primary key (id) 
) charset utf8mb4 collate utf8mb4_0900_ai_ci
engine=InnoDB;

-- insertamos un registro que contenga mayúsculas y acentos
insert into personas2 values(0,'Wendy Itzel Roldán','wendy@hotmail.com','1234567890');

-- Detecta las 3 tipos de búsqueda
select * from personas2
where nombre='WENDY ITZEL ROLDAN';

select * from personas2
where nombre='Wendy Itzel Roldán';

select * from personas2
where nombre='Wendy Itzel Roldan';
