-- SET consiste de un un conjunbto de multiples miembros separados por comas
-- almacenamiento ocupado de 1,2,3,4 u 8 bytes
drop table tiposDatos;
create table tiposDatos(
	id integer,
	idioma set('español','ingles','italiano') not null -- acepa hasta 64 elementos
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

delete from tiposDatos;
insert into tiposdatos (id,idioma) values (1,"español");
insert into tiposdatos (id,idioma) values (2,"italiano,español"); -- cuando consultas se guarda en el orden del set no en como se insertó
insert into tiposdatos (id,idioma) values (3,"italiano,italiano"); -- puede generar errores, de acuerdo a la variuble strict SQL, sino solo guarda un solo

-- en vez de insertal explicitamente un elemento del set se puede agregar de acuerdo al numero de combinación del set
insert into tiposdatos (id,idioma) values (4,1);
insert into tiposdatos (id,idioma) values (5,2);
insert into tiposdatos (id,idioma) values (6,3);
insert into tiposdatos (id,idioma) values (7,4);
insert into tiposdatos (id,idioma) values (8,5);
select * from tiposdatos;

-- consulta
select idioma from tiposdatos
where idioma="italiano"; -- buscamo elemeno exacto

-- consulta
select idioma from tiposdatos
where idioma like "%italiaNo%"; -- elementos similares, aproximado

select idioma from tiposdatos
where idioma="italiano,ingles"; 

select idioma from tiposdatos
where find_in_set("italiano",idioma);  -- con función

select * from tiposdatos
where idioma=1;  -- con indice