-- OVER version 8.0 mysql
-- ordenar sin grouping
-- las funciones de ventana o también conocidad como over pueden ser utilizadas con
-- cuaquier función de agragación de las que ya se conocen como sum,count,...,etc

-- En la clausula over no se utiliza la clausula group by, de hecho los grupos
-- aquí formados no se muestran en un simple renglón, sino en todos los necesarios 
-- o utilizados en el agrupado

-- la clausula over nos indica las particiones que utilizaremos en nuestro recordset
-- Al codificar un simple over muestra los resultados de una partición simple

-- Al utilizar over en combincación de Partition by, especificamos algún campo agrupado de en nuestro recorset

-- mostramos de la tabla entradaSalidaDinero los registros con fecha de entrada salida de 2018 y enero
-- over(*) nos cuenta todo, con partition solo una parte 
select entradasalidadinero.idPersonaRegistro, fechaEs, montoIE
from entradasalidadinero
where year(fechaEs)=2018 and month(fechaEs)=1;



select entradasalidadinero.idPersonaRegistro, fechaEs, montoIE,
sum(montoIE) over() as 'TotalMontoIE', -- nos agrega un nuevo campo donde muestra en cada renglón la suma del monto
sum(montoIE) over(partition by idPersonaRegistro order by montoIE desc) as 'TotalMontoIEPorID', -- resumen montoIE por persona
count(idPersonaRegistro) over() as 'TotalPersonas',
count(idPersonaRegistro) over(partition by idPersonaRegistro) as 'TotalPersonasPorID'
from entradasalidadinero
where year(fechaEs)=2018 and month(fechaEs)=1;

select personas.nombre,
sum(entradasalidadinero.idPersonaRegistro) over() as 'montoIngEgreTotal',
count(*) over() as 'TotalRegistros', -- nos agrega un nuevo campo donde muestra en cada renglón la suma del monto
count(*) over(partition by personas.nombre) as 'TotalRegistrosPorID' -- resumen montoIE por persona
from personas
inner join entradasalidadinero on (personas.id=entradasalidadinero.idPersonaRegistro)
inner join ingresosegresos on (ingresosegresos.id=entradasalidadinero.idIngresosEgresos)
where year(fechaEs)=2018 and month(fechaEs)=1;