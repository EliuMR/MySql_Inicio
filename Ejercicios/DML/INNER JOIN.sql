-- INNER JOIN
-- un join combina de dos o más tablas del mismo resultset basado en condiciones que se especofoqien
-- las tablas son unidad típicamente en la relación mediante la llave primari
-- de una tabla con la llave foránea de la otra

-- select select_list
-- from table_1
-- 		[inner] join table_2 on join_condition_1
-- 		[inner] join table_3 on join_condition_2

use bdPendiente;

select * from entradaSalidaDinero
inner join personas on entradaSalidaDinero.idPersonaRegistro=personas.id;


select personas.id, entradasalidadinero.id from entradaSalidaDinero
inner join personas on entradaSalidaDinero.idPersonaRegistro=personas.id;

-- podemos saber qué persona hizo el registro con dos tablas
select entradasalidadinero.fechaEs, entradasalidadinero.montoIE,
 entradasalidadinero.idPersonaRegistro, personas.nombre
 from entradaSalidaDinero
inner join personas on entradaSalidaDinero.idPersonaRegistro=personas.id;


-- hacer uso de tres tablas
-- no es una sutitución si no extraer información
-- para sacar información es necesario de llaves foráneas
-- uno para extraer el nomnbre de persona que registro con su id
-- otro para saber el ingreso egreso de acuerdo a su id
select entradasalidadinero.fechaEs, entradasalidadinero.montoIE,entradasalidadinero.idPersonaRegistro,
personas.nombre, entradasalidadinero.idIngresosEgresos, ingresosegresos.descripción
from entradasalidadinero
inner join personas on entradasalidadinero.idPersonaRegistro=personas.id
inner join IngresosEgresos on entradasalidadinero.idIngresosEgresos=ingresosegresos.id;

-- 4 tablas
select entradasalidadinero.fechaEs, entradasalidadinero.montoIE,entradasalidadinero.idPersonaRegistro,
personas.nombre, entradasalidadinero.idIngresosEgresos, ingresosegresos.descripción, 
tipoingresoegreso.descripcion
from entradasalidadinero
inner join personas on entradasalidadinero.idPersonaRegistro=personas.id
inner join IngresosEgresos on entradasalidadinero.idIngresosEgresos=ingresosegresos.id
inner join tipoingresoegreso on ingresosegresos.idTipoIngresoEgreso =tipoingresoegreso.id;


-- 5 tablas
select entradasalidadinero.fechaEs, entradasalidadinero.montoIE,entradasalidadinero.idPersonaRegistro,
personas.nombre, entradasalidadinero.idIngresosEgresos, ingresosegresos.descripción, 
tipoingresoegreso.descripcion, grupoingresoegreso.descripcion
from entradasalidadinero
inner join personas on entradasalidadinero.idPersonaRegistro=personas.id
inner join IngresosEgresos on entradasalidadinero.idIngresosEgresos=ingresosegresos.id
inner join tipoingresoegreso on ingresosegresos.idTipoIngresoEgreso =tipoingresoegreso.id
inner join grupoingresoegreso on ingresosegresos.idGrupoIngresoEgreso=grupoingresoegreso.id;

select * from personas;
select * from entradasalidadinero;
select * from ingresosegresos;

