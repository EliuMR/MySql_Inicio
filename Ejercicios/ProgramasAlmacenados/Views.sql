-- VISTAS VIEWS
-- Las vistas son guardadas en la base de datos para ser más accesibles, están compuestas de una clausula
-- select con una o más tablas de bases de datos con funciones o sin funciones propias de lenguaje sqñ.

-- Ventajas:
-- Limitan la exposición de las tablas a os usuarios permitiéndoles sólo mostrar la información que se desee
-- Ocultar la complejidad en la extración de datos para los usuarios o programadores
-- Con ciertas restricciones las vistas pueden ser utilizadas para actualizar, borrar e insertar datos 
-- hacia la base de datos
-- Es más rápido que querrys


use bdPendiente;
-- Crear una vista con una sóla tabla, personas y sólo mostrar dos campos
create view personasview as 
select nombre,correo from personas;

-- ejecutando la vista personasvies
select * from personasview;

-- crear una nueva lista remplazando la anterior con un campo extra
create or replace view personasview as 
select nombre,correo,telefono from personas;

select * from personasview;

-- crear la misma vista pero que sólo filtre las personas que tiene correo de hotmail
-- y las de yahoo
create or replace view personasview as 
select nombre,correo,telefono from personas
where correo like "%hotmail%"
union -- une dos consultas
select nombre,correo,telefono from personas
where correo like "%yahoo%";

-- seleccione las personas que tengan más de 8 movimientos y además que muestre
-- la suma de dichos movimientos de la tabla entrada salida

create view MovimientosPersona as
select nombre,count(*),sum(montoIE) 
from entradasalidadinero
inner join personas on personas.id=entradasalidadinero.idPersonaRegistro
group by 1
having count(*)>8; -- instucción cuentra los conteos mayor a X

select * from MovimientosPersona;

-- actualizar update la vista personasviews
-- no es posible si la vista lleva union, restrict
update personasview
set nombre = concat(nombre,'-');

-- eliminar la vista personasviews
drop view personasview;

