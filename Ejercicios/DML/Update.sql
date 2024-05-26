-- UPDATE

-- update nombre_tabla
-- set nombre_columna=expresion1[,nombre_columna2=expresion2]...
-- [where condition]

-- modifica uno o más registros en la tabla
-- en la  clausula set puedes llamar el nombre de una o más columnas y asignarle su nuevo valor
-- where, condición

use bdPendiente;
-- Incrementar un 10% a todos montos de la tabla entradaSalidaDinero donde 
-- la fecha se igaul al 3 de enro de 2018
select * from entradasalidadinero;
SET SQL_SAFE_UPDATES = 0;-- para error safe update
update entradasalidadinero
set montoIE=montoIE*(1.03)
where fechaEs='2018-01-03';

-- cambiar el password a todos los usuarios cuyo correo del dueño sea hotmail
select * from usuarios;
select * from personas;

update usuarios
set pasword='nuevoPaswors'
where idPersona in (select id from personas
					where personas.correo like '%hotmail%');


select * from personas
inner join usuarios on usuarios.id=personas.id
where personas.correo like '%hotmail%';

select id from personas;

-- Actualizar una tabla a partir de otra tabla en la primer tabla
-- solo traen  nombres las personas y en la segunda traen apellido
-- supongamos que la tabla personas sólo tiene nombre y no apellido los elementos
-- pero sí en tmpPersonas

drop table if exists tmpPersonas;
create table tmpPersonas as 
select * from personas;
select * from tmpPersonas;

update personas
set personas.nombre=(select tmpPersonas.nombre from tmpPersonas where personas.id=tmpPersonas.id
					)
where personas.id= (select tmpPersonas.id from tmpPersonas where personas.id=tmpPersonas.id)

