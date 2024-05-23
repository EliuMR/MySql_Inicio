-- Is Null es para preguntar a la base de datos campos sin valor nulos,
-- no hay que confundirese con la cadena '' o con un valor 0

-- where espression is [not] null;

use bdPendiente;

-- insertaos algunos valores para demostras el uso de is null y trabajar copn valores nuñlos
insert into personas (id, nombre) 		values(0,'Pedro de la rosa');
insert into personas (id, nombre,correo)values('0', 'Ramon', 'ramon@gmaiul.com');
insert into personas (id, nombre,telefono)		values('0','Leticia','letica@');
insert into personas (id,nombre,telefono)	values(0,'Norma','');

select * from personas;

select * from personas
where telefono<>''; -- diferentes a vacio

select * from personas
where telefono IS NULL; -- valores nulos

select * from personas
where telefono IS not NULL; -- valores no nulos
