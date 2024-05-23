-- función Left, trabaja con cadenas y extra el numero de caracteres finales que le indiquemos
-- left(cadena,numero_de_caracteres)alter

-- funcion date_format, da formato a las columnas de tipo fecha
-- date_format(fecha,formato_de_cadena)alter

-- función round, función para dar formato con respecto al redondeo de datos numéricos
-- round(número[número de decimales])

-- Vamos a trabajar con la base de dato de bdPendiente
use bdPendiente;

-- ejemplo usando las tres funciones anteriores
-- extraer los 10 primeros caracteres de un campo de nase de datos llamdo observaciones y popor último redonderar un dato numérico en tres formatos con información en la tabla

-- Ingresamos 10 nuevos elementos a la tabla entradaSAlidaDinero
load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\datos+con+decimales.csv'
into table entradaSalidaDinero
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select id,fechaES,date_format(fechaES,'%d/%m/%y') as 'fecha1',
date_format(fechaES,'%d-%b-%Y') as 'fecha2',
observaciones, left(observaciones,10) as "Primeros caracateres",
montoIE, round(montoIE) as 'redondeo1',-- redondeo, si no coloco un numero redondea a entero
round(MontoIE,1) as 'redondeo2'
from entradasalidadinero
where id>500; -- para mostrar lo nuevos datos, ya que ya había 500 datos


-- TEST sin probar en tablas, para ver la salida de las funciones, para despues probar en campos
-- select sin from, i.e una tabla
select current_date(),date_format(current_date(),'%Y-%M-%D') as 'fechs1';

select "no", concat("no ",current_date(), left(" no es un buen día",10)) as 'cadena1';

select sum(10+15), round(12342343.1243422,2);