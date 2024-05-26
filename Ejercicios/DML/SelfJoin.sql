-- Self join
-- para unir una tabla con ella misma
-- cuando tu creas un self-join se debe usar un alias para las tablas, por lo menos
-- para una y mandar llamar los campos con el alias

-- para ejercicio, agregar el campo para el uso de self-join
use bdPendiente;
alter table personas
add column idPersonasJefe int(11) null after telefono;
select * from personas;

-- actualizar los jefes de cada personas
update personas
set idPersonasJefe =4
where id not in (7,3,6,7,9,10);
update personas
set idPersonasJefe =1
where id in (7,3,6,7,9,10);

select * from personas;

-- hacemos una consulta con el uso de self join
-- Esto resulta más práctico hacerlo con otra tabla, para poder hacer una relación 1 a muchos y no 1-1
select personas.id, personas.nombre, personas.correo, personas.telefono
,personas.idPersonasJefe,jefes.nombre as "NombreJefe", jefes.correo
from personas
join personas jefes on personas.idPersonasJefe=jefes.id;