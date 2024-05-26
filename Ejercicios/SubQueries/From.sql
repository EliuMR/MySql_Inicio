-- FROM
-- tabla virtual

-- hacer uso de una subconsulta utilizando las tablas entradaSalidaDinero y la tabla de personas
-- para que podamos extraer de dicha unión el idPersonas, el nombre y la suma de sus ingresos egresos,
-- una vez que tengamos esta tabla virtual hay que hacer un inner join con la tabla de usuarios
-- para poder filtrar las personas con id=1,2,3 y mostrar campos de la tabla virtual y de la tabla 
-- usuarios (la externa no virtual)

-- Esto es un registro pero también es una tabla
-- tabla virtual
(select idPersonaRegistro, nombre, sum(montoIE) as 'Total' from personas
inner join entradasalidadinero 
on personas.id=entradasalidadinero.idPersonaRegistro
group by idPersonaRegistro, nombre) ;

select Aux.nombre, usuarios.nombre as 'Nombre Usuario', sum(Total)
from 	(select idPersonaRegistro, nombre, sum(montoIE) as 'Total' from personas
				inner join entradasalidadinero 
				on personas.id=entradasalidadinero.idPersonaRegistro
				group by idPersonaRegistro, nombre
				) as Aux
inner join usuarios on (usuarios.idPersona=Aux.idPersonaRegistro)
where Aux.idPersonaRegistro in (1,2,3)
group by Aux.nombre, usuarios.nombre;