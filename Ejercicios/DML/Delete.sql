-- DELETE
-- delete from nombre_tabla
-- [where condición]

-- borrar uno o más registros de la tabla

use bdPendiente;
drop table if exists tmpPersonas;
create table tmpPersonas as 
select * from personas;

-- borrar los registros que el tamaño de cadena del nombre sea mayor o igual a 25 de la tabla tmpPersonas
delete from tmpPersonas
where length(nombre)>=25;
select * from tmpPersonas;

-- borrar todos los registros de la tabla usuarios que estén dentro de la tabla personas
-- con id<=3
delete from usuarios
where usuarios.idPersona in (select id from personas where id<=3);
select * from usuarios;

-- borrar todo de tmpPersonas
delete from tmpPersonas;
select * from tmpPersonas;