-- subconsultas correlacionadas
-- es una subconsulta que se ejecuta una vez por cada registro de la 
-- consulta principal o consulta padre


-- sacamos el promedio de cada idPersona, luego con ese promedio mostramos los registros
-- de la tabla entradaSalidaDinero comparando por cada idPersona con su propio promedio
-- para mostrar sólo los que sean mayor a su propio promedio.

-- mostramos idPersonaRegistro de 1 y 2
select * from entradasalidadinero
where idPersonaRegistro in (1,2); 

-- Esto muestra el idPersonaRegistro y el promedio de montoIE para las filas donde idPersonaRegistro es 1 o 2.
select idPersonaRegistro, avg(montoIE) from entradasalidadinero
where idPersonaRegistro in (7)
group by 1;

select * ,(
				select avg(montoIE) from entradasalidadinero
				where idPersonaRegistro = ESD.idPersonaRegistro -- dinamico, se compara con la tabla padre
			) as 'Promedio ID'
from entradasalidadinero ESD -- alias tabla padre
where montoIE<(
				select avg(montoIE) from entradasalidadinero
				where idPersonaRegistro = ESD.idPersonaRegistro -- dinamico, se compara con la tabla padre
			)