-- WITH ROLLUP
-- el uso de with rollup es utilizado con group by para agreagar renglones con resúmenes
-- de los grupos al final

-- agrega un resumen en un renglón por cada grupo especificado en el group by
-- si solo se especifica un solo campo en el group by entonces se mostrá el resumen final
-- retorna un dato nulo para dar un resumen

-- Hacemos un inner join de tres tablas para sacar la suma del dinero que entró o salió y cuántos registros 
select 
sum(entradasalidadinero.montoIE) as 'Descripción Ing Eg',
count(*) as 'Cuántos registros' 
from entradasalidadinero
inner join personas on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos); 


select 
	personas.nombre as 'Nombre',
	ingresosegresos.descripción as 'Descripcion',
	sum(entradasalidadinero.montoIE) as 'Descripción Ing Eg',
	count(*) as 'Cuántos registros' 
from entradasalidadinero
inner join personas 		on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos 	on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
group by 1,2 with rollup; -- resumenes de los grupos de información
-- order by 1,2;