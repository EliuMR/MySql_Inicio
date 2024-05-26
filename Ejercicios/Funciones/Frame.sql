-- FRAMES
-- Frame: el numero de renglones antes y después del actual renglón o rango de valores basados en el 
-- actuál renglón

-- Frame {rows|range} {frame_start | between frame_start and frame_end}

select personas.nombre,ingresosegresos.descripción,entradasalidadinero.montoIE,
sum(entradasalidadinero.idPersonaRegistro) over() as 'montoIngEgreTotal',
count(*) over() as 'TotalRegistros', -- nos agrega un nuevo campo donde muestra en cada renglón la suma del monto
count(*) over(partition by personas.nombre) as 'TotalRegistrosPorID', -- resumen montoIE por persona
sum(entradasalidadinero.montoIE) over(partition by personas.nombre) as 'RegistrosPorPersona',
sum(entradasalidadinero.montoIE) over (partition by personas.nombre order by
	entradasalidadinero.montoIE asc
    rows between unbounded preceding and current row) as 'acomulados' -- acumulador por las particiones
from personas
inner join entradasalidadinero on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
where year(fechaEs)=2018 and month(fechaEs)=1;

select personas.nombre,ingresosegresos.descripción,entradasalidadinero.montoIE,
sum(entradasalidadinero.idPersonaRegistro) over() as 'montoIngEgreTotal',
count(*) over() as 'TotalRegistros', -- nos agrega un nuevo campo donde muestra en cada renglón la suma del monto
count(*) over(partition by personas.nombre) as 'TotalRegistrosPorID', -- resumen montoIE por persona
sum(entradasalidadinero.montoIE) over(partition by personas.nombre) as 'RegistrosPorPersona',
sum(entradasalidadinero.montoIE) over (partition by personas.nombre order by
	entradasalidadinero.fechaEs desc
    range between unbounded preceding and current row) as 'acomulados' -- va ser agrupación por pares pair group, por ejemplo fechas
from personas
inner join entradasalidadinero on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
where year(fechaEs)=2018 and month(fechaEs)=1;