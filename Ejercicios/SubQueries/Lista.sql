-- SUBCONSULTA LISTA

-- saca los ingresos egresos de la tabla entradaSalidaDinero donde el nombre de las 
-- personas coinicda con la palabra JUAN haz uso de inner join
use bdPendiente;
select idPersonaRegistro, idIngresosEgresos, montoIE 
from entradasalidadinero
inner join personas on (entradasalidadinero.idPersonaRegistro=personas.id)
where personas.nombre like "%JUAN%";


-- saca los ingresos egresos de la tabla entradaSalidaDinero donde el nombre de las 
-- personas coinicda con la palabra JUAN sin uso de inner join
use bdPendiente;
select idPersonaRegistro, idIngresosEgresos, montoIE 
from entradasalidadinero
where entradasalidadinero.idPersonaRegistro in 
(select id from personas where nombre like "%JUAN%"); -- subconsulta