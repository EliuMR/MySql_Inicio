-- Grouping version 8.0 mysql
-- Dar nombre y dar forma a consultas
use bdPendiente;
select 
	personas.nombre as 'Nombre',
	ingresosegresos.descripción as 'Descripcion',
    
    if (grouping(personas.nombre)=1,
		'Total General', -- si la evaluación es verdadera
        '' -- evaualción falsa
        ) as 'Total General',
    if (grouping(ingresosegresos.descripción)=1,
		'Total Grupo', -- si la evaluación es verdadera
        '' -- evaualción falsa
        ) as 'Total Grupo',
        
	sum(entradasalidadinero.montoIE) as 'Descripción Ing Eg',
	count(*) as 'Cuántos registros' 
from entradasalidadinero
inner join personas 		on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos 	on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
group by 1,2 with rollup; -- resumenes de los grupos de información