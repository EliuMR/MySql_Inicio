-- Distinct

use bdPendiente;
-- sacar las fechas que no se repiten
select distinct fechaES from entradaSalidaDinero;
-- contar cuantas hay diferentes
Select count( distinct fechaES) from entradaSalidaDinero;

select distinct year(fechaEs) from entradaSalidaDinero;

select distinct idIngresosEgresos from entradaSalidaDinero;

-- Where limitar los registros, el set de resultados de una tabla en base a los criterios
-- where expresion1 operador expresion2
-- =
-- <
-- >
-- <= 	menor igual
-- >= 	mayor igual
-- <> 	distinto de. a diferente de b
-- !=	distinto de

select * from personas
where id>2;

-- selecciona todos los campos de la tabla entradaSalidaDinero donde la fecha sea igual 1 de eenero de 2018
select * from entradasalidadinero
where fechaES="2018-01-01";

-- combinando operadores aritmeticos y de comparación
-- monto que dividido entre dos sea menor a 1000
select *,montoIE/2 from entradaSalidaDinero
where (montoIE/2)<100;

-- de la tabla personas muestra cuya primera letra del nombre sea menor a la letra K
select *,left(nombre,1) as 'primera letra' from personas
where left(nombre,1)<'k';