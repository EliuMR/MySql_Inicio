-- ANY subconsultas
-- podemos usar la palabra reservada ANY para evaluar una condición la cual es true para uno o 
-- más de los valores regresados por la subconsulta

-- Si la subconsulta no regresa renglones o regresa solo valores null la comparación que usa la
-- palabtra reservada any será siempre false
-- La palabra reservada some es igual a any

use bdPendiente;
-- montoIE > ANY
-- monto mayor a cualquiera de la subconsulto
select * from entradasalidadinero
where montoIE> any (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- montoIE <ANY
-- monto menor a calquiera de la subconsulta, practimanete menor al mayor de la subconsulta
select * from entradasalidadinero
where montoIE< any (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- montoIE = ANY
-- montoIE igual a cualquiera de la subconsulta
select * from entradasalidadinero
where montoIE= any (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- monto <> ANY
-- monto diferente a cualquiera de la subconsulta
-- asegurarse que la subsconsulta sea un valor, sino cosas extrañas
select * from entradasalidadinero
where montoIE> any (select montoIE from entradasalidadinero where idIngresosEgresos=6);

-- excepción datos vacios
select * from entradasalidadinero
where montoIE> any (select montoIE from entradasalidadinero where idIngresosEgresos=10000);