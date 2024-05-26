-- SubQueries

use bdPendiente;
-- consulta
select * from entradasalidadinero;
-- SUBCONSULTA ESCALAR: nos regresan un único dato (una columna y una fila)

-- Sacar todos los registros de la tabla entradaSalidaDinero pero solo aquello
-- cuyo montoIE sea mayor al promedio de dicho campo
select avg(MontoIE) from entradasalidadinero;

select *, (select avg(MontoIE) from entradasalidadinero) as 'promedio'
from entradasalidadinero
where montoIE> (select avg(MontoIE) from entradasalidadinero); 
