-- Group by y Having
-- group by agrupa los renglones de un result set basado en una o más columnas en una expresion 
-- pueden incluir varias columnas separadas por comas

-- Al incluir funciones de agregación en la clausula select la agregación es calculada
-- por cada grupo  especificado en el group by

-- having especifica una condición de búsqueda para un grupo de agregación

-- select select_list
-- from table_source
-- [where search_condition]
-- [group by group_by_list]
-- [having search_condition]
-- [order by order_by_list]

-- consuta para sacar tres campos de nuestra base de datos
-- de doferentes tablas para agruparlos de diferentes maneras
-- extrar un campo de cada una de ellas

select * from entradasalidadinero;

select personas.nombre as 'Nombre Persona',
ingresosegresos.descripción as 'Descripción Ing Eg',
entradasalidadinero.montoIE as 'monto Ingreso Eg'
from entradasalidadinero
inner join personas on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos); 


select sum(montoIE) from entradasalidadinero;

-- agrupación por nombre y descripción
select personas.nombre as 'Nombre',
ingresosegresos.descripción as 'Descripcion',
sum(montoIE) as 'monto'
from entradasalidadinero
inner join personas on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
group by Nombre, Descripcion; 

-- agrupacion solo por nombre
select personas.nombre as 'Nombre',
-- ingresosegresos.descripción as 'Descripcion',
sum(montoIE) as 'monto'
from entradasalidadinero
inner join personas on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
group by Nombre; 


-- agrupación por descripción
select 
-- personas.nombre as 'Nombre',
ingresosegresos.descripción as 'Descripcion',
sum(montoIE) as 'monto'
from entradasalidadinero
inner join personas on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
group by Descripcion; 

--
select personas.nombre as 'Nombre',
ingresosegresos.descripción as 'Descripcion',
sum(montoIE) as 'monto',
count(*) as 'Cuántos registros' -- cuántos registros hay agrupados
from entradasalidadinero
inner join personas on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
where nombre in ('ANDRES PEREZ LOPEZ','ARACELI ORTIZ PINEDO') -- filtramos por dos nombres, se hace antes de agrupar
group by Nombre, Descripcion -- equivalente a group by 1,2
having sum(montoIE)>=1000 and count(*)=2	 -- filtro después de agrupar
order by Nombre asc; 		 -- equivalente order by 1