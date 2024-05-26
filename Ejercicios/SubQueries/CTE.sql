-- CTE Common Table expression, verison 8. sql
-- una cte es una sentencia Select que crea una o mas resulset temporales que pueden ser usadas por el siguiente query
-- se puede usar CTEs tanto con instrucciones select insert, update, deleate
-- su uso es para simplicar sintaxis para tablas virtuales

-- with [recursive] cte_name as (subquerry1)
-- [(,cte_name1 as subquerry1)]
-- [...]
-- sql_statement

use bdPendiente;
select Aux.nombre, usuarios.nombre as 'Nombre Usuario', sum(Total)
from 	(select idPersonaRegistro, nombre, sum(montoIE) as 'Total' from personas
				inner join entradasalidadinero 
				on personas.id=entradasalidadinero.idPersonaRegistro
				group by idPersonaRegistro, nombre
				) as Aux
inner join usuarios on (usuarios.idPersona=Aux.idPersonaRegistro)
where Aux.idPersonaRegistro in (1,2,3)
group by Aux.nombre, usuarios.nombre;

 -- convertit las instrucciones anterior por el uso de CTEs
 with Aux as (	select idPersonaRegistro, nombre, sum(montoIE) as 'Total' from personas
				inner join entradasalidadinero 
				on personas.id=entradasalidadinero.idPersonaRegistro
				group by idPersonaRegistro, nombre
			  )-- tabla virtual
select Aux.nombre, usuarios.nombre as 'Nombre Usuario', sum(Total) 
from Aux
inner join usuarios on (usuarios.idPersona=Aux.idPersonaRegistro)
where Aux.idPersonaRegistro in (1,2,3)
group by Aux.nombre, usuarios.nombre;