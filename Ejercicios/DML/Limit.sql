-- LIMIT
-- limita el numero de renglones regresados por una sentencia SELECT, puede tener uno o dos parámetros

-- especificamos el número máximo de registros a regresar empezando 
-- desde el primer registro. Al codificar los dos parámetros el poffset especiofica el primer renglón a regresa

-- regularmente limit va de la mano con la clausula order by

-- limit [offset,] row count

-- ejecuta una instrucción SQL que regrese los primeros 10 renglones
-- de la tabla pendientes ordenanos por id asc
use bdPendiente; 

select * from pendientes
order by id asc
limit 12; -- si excedemos la cantidad no pasa nada

-- que regrese 6 renglones ordenando los datos de forma ascendente por el id
-- aparte que empiece desde el renglón 6
select * from pendientes
order by id asc
limit 5,6; -- permite la paginación


