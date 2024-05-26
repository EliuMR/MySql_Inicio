-- Alias en inner join
-- siempre se debe usar alias no el nombre original

-- select select_list
-- from table_1 t1
-- 		[inner] join table_2 t2 on t2.nombre_col operador t1.nombre_col
--      [inner] join table_3 t3 on t3.nombre_col operador t2.nombre_col
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
-- Hacer alias con la anterior 
select 
t1.fechaEs, 	t1.montoIE,				t1.idPersonaRegistro,
t2.nombre, 		t1.idIngresosEgresos, 	t3.descripción, 
t4.descripcion, t5.descripcion
from entradasalidadinero t1
inner join personas t2 				on t1.idPersonaRegistro=t2.id
inner join IngresosEgresos t3 		on t1.idIngresosEgresos=t3.id
inner join tipoingresoegreso t4 	on t3.idTipoIngresoEgreso =t4.id
inner join grupoingresoegreso t5	on t3.idGrupoIngresoEgreso=t5.id;
