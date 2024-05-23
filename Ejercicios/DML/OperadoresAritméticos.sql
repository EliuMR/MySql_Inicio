use bdPendiente;
-- Vamos a trabajar con la base de dato de bdPendiente
-- Realizamos una consulta de la tabla entradaSalidaDinero analizando un ingreso con id=368
select idIngresosEgresos, montoIE,  -- para que solo me salgan dos campos
montoIE/2 as "divisionDos",
montoIE div 2 as "parteEntera",
montoIE mod 2 as "Residuo"
from entradaSalidaDinero
where id=368;

-- hacemos uso de parentesis en operación aritmética para demostrar presdencia
select idIngresosEgresos, montoIE,  -- para que solo me salgan dos campos
montoIE+2*(3-2*3.3) as "Dato"
from entradaSalidaDinero
where id=368;