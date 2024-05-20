-- Select
-- select campos_seleccionados
-- from tablas_de_datos *nombre de las tablas de donde se extraerá los datos
-- [where condition] *condición a cumplis
-- [order by ordenar_por_lista_campos] *especifica cómo serán ordenados los datos
-- [limit limite_de_renglones] *número de renglones por ejemplo los primero 10 registros

-- Vamos a trabajar con la base de dato de bdPendiente

use bdPendiente;
-- sentencia que regresa todos los registros de la tabla personas
select * from personas;
select * from usuarios;

-- regresa los campos nombre y correo de la tabla personas por cada renglon y ordena de forma descendente por nombre
select nombre,correo 
from personas
order by nombre desc;

-- regresa fecha de entrada o salida de dinero, el monto de entrada o salida
-- de la tabla entradaSalidaDinero, donde la fecha entre el 1-01-2018 y 31-01-2018
-- ordenando por fecha ascendente, los dos primeros
select fechaES,montoIE 
from entradaSalidaDinero
where fechaES between '2018/01/01' and "2018/01/31"
order by fechaEs asc
limit 2; 

-- regresa los registros de la tabla entradaSalidaDinero cuyo monto sea mayot o igual a 500
-- y ese monto se muestra multiplicado por 2, solamente muestra los campos id, fechas
select id,fechaEs,montoIE*2 as "Multiplicado por dos" -- puede llevar as o no,pero por buena práctica sí
from entradaSalidaDinero
where montoIE>= 500
;

