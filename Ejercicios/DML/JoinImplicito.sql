-- Inner join
-- en lugar de codificar con from se puede con where escribiendo las condiciones

-- select select_list
-- from tabla_1,tabla_2,[,tabla3]...
-- where tabla_1.columna_name operato tabla_2.columna_name
-- [tabla_2.columna_name operato tabla_3.columna_name]

-- 5 tablas
use bdPendiente;
select entradasalidadinero.fechaEs, entradasalidadinero.montoIE,entradasalidadinero.idPersonaRegistro,
personas.nombre, entradasalidadinero.idIngresosEgresos, ingresosegresos.descripción, 
tipoingresoegreso.descripcion, grupoingresoegreso.descripcion
from entradasalidadinero
inner join personas on entradasalidadinero.idPersonaRegistro=personas.id
inner join IngresosEgresos on entradasalidadinero.idIngresosEgresos=ingresosegresos.id
inner join tipoingresoegreso on ingresosegresos.idTipoIngresoEgreso =tipoingresoegreso.id
inner join grupoingresoegreso on ingresosegresos.idGrupoIngresoEgreso=grupoingresoegreso.id;

-- Hacer lo anterior con el uso implicito de inner join
select  entradasalidadinero.fechaEs, entradasalidadinero.montoIE,entradasalidadinero.idPersonaRegistro,
personas.nombre, entradasalidadinero.idIngresosEgresos, ingresosegresos.descripción, 
tipoingresoegreso.descripcion, grupoingresoegreso.descripcion
from entradaSalidaDinero, personas, ingresosEgresos, tipoIngresoEgreso, 
grupoIngresoEgreso
where entradasalidadinero.idPersonaRegistro=personas.id
and entradasalidadinero.idIngresosEgresos=ingresosegresos.id
and ingresosegresos.idTipoIngresoEgreso =tipoingresoegreso.id
and ingresosegresos.idGrupoIngresoEgreso=grupoingresoegreso.id;

