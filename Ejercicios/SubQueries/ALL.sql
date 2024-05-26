-- ALL para subconsultas
-- la palabra ALL es una condición de compración la cual es true para todos los valores regresado para un subquerry
-- Si la subconsulta no regresa renglones la comparacion será true
-- si alfuno de los renglones regresados por la subconsulta contiene un valor nulos, entronces siempre será false

-- X> ALL(1,2)  ==  X>2 	== Es verdadero si X es mayor que el máximo valor regresado por la subconsuilta

use bdPendiente;
-- Monto IE > all
-- compara con el mayor de la subconsulta
select * from entradasalidadinero
where montoIE> all (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- Monto IE < all
select * from entradasalidadinero
where montoIE< all (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- Monto IE = all
-- este regresa falso porque montIE debe ser igual a todos los de la subconsulta
select * from entradasalidadinero
where montoIE = all (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- este regresa true porque montIE debe ser igual a todos los de la subconsulta, ya que montoIE es igual en toda la subconsulta
select * from entradasalidadinero
where montoIE = all (select montoIE from entradasalidadinero where idIngresosEgresos=3);

-- montoIE <> all
select * from entradasalidadinero
where montoIE <> all (select montoIE from entradasalidadinero where idIngresosEgresos=1);

-- excepción datos siempre será TRUE, con un idIngresoEgreso que no existe
select * from entradasalidadinero
where montoIE = all (select montoIE from entradasalidadinero where idIngresosEgresos=10000);

-- Un dato con null, con un idIngresoEgreso NULL regresará una consulta null