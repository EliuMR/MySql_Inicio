-- Funciones agregado

-- AVG([all|distinct]expresion) 	promedio
-- sum([all|distinct]expresion)		suma de los valores no nulos de la consulta
-- min([all|distinct]expresion)		minimo de los valores
-- max([all|distinct]expresion)		maximo de los valores
-- count([all|distinct]expresion)	el número de los registros de la consulta realizada
-- count(*)							número total de registros de la consulta realizada

-- sacamos el total de registros cuya fecha de entrada o salida sea mayo al año 2018
-- también mostramos el promedio de dichos montos,  y la suma total de dinero manejado en ese periodo de tiempoo
-- así como el valor mínimo y máximo manejado en esos año
-- cuántas personas distintas están involucradas
use bdPendiente;
select 'fecha mayor a 2018', count(*) as 'Total registros', 
count(distinct(idPersonaRegistro)) as 'Personas distintas',
round(avg(montoIE),2) as 'Promedio',
sum(montoIE) as 'Suma total', min(montoIE) as 'mínimo', max(montoIE) as 'máximo'
 from entradasalidadinero
where year (fechaES)>2018;

-- demostramos como también máximo y minimo puden ser usado en campos de tipo texto
select min(nombre) as 'mínimo', max(nombre) as 'máximos' from personas;