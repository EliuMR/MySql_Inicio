-- Operador IN
-- permite validar si una lista de elementos son validor para mostrar
-- podemos combinar el operador in con not
-- se pueden usar subconsultar en dicho operador

-- where test_expresion [not] in ({subconsulta|expresion_1[,expresion2]...})

use pdPendiente;

-- selecciona todad las personas con id=1,2,3 o 4, se puede usar or pero no siempre podar ser practico
-- despues todos los que no sean esos valores usando not

select * from personas
where id in (1,2,3,4);


select * from personas
where id not in (1,2,3,4);

-- seleciona de la tabla personas los registros que coincidadn con 'Juan Perez Garcia, 'Araceli Ortiz Pinedo'
select id from personas
where nombre in('JUAN PEREZ GARCIA','ARACELI ORTIZ PINEDO', 'ANDRES PERES LOPEZ');

select id from personas
where nombre NOT in('JUAN PEREZ GARCIA','ARACELI ORTIZ PINEDO', 'ANDRES PERES LOPEZ');

-- SUBCONSULTA
-- realiza una consulta de la entradaSalidaDinero donde el idPersonas sea el de
-- 'Juan Perez Garcia, 'Araceli Ortiz Pinedo' pero haciendo subconsulta en la tabla personas

select * from entradasalidadinero
where idPersonaRegistro in 
(select id from personas
	where nombre in('JUAN PEREZ GARCIA','ARACELI ORTIZ PINEDO', 'ANDRES PERES LOPEZ')
);

-- BETWEEN, validar si una lista de elemento son validos para mostrar desde un límite dmenor hasta uno mayor
-- where test_expresion [NOT] between inicio and fin

-- seleccionar todos los registros de entradaSalidaDinero donde la fecha
-- sea del uno de enero y 31 de diciembre de 2018
-- y que también su montoIE esté entre 100 y 200

select * from entradaSalidaDinero
where (fechaES between '2018/01/01' and '2018/12/31') 
and (montoIE between 100 and 200);  

-- de la tabla personas el nombre empiece desde A hasta K
select * from personas
where left(nombre,1) between 'A' and 'K';