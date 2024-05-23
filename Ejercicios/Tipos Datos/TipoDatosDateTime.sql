drop table tiposDatos;
create table tiposDatos(
	dateType date,
    datetimeType datetime
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

delete from tiposDatos;
insert into tiposDatos (dateType,datetimeType) values(current_timestamp(), now()); -- insertamos el time actual
-- insert into tiposDatos (dateType) value("2022/02/31"); -- fecha incorrecta
-- formatos fechas correctas
insert into tiposDatos (dateType) value("20220331");
insert into tiposDatos (dateType) value("2022-03-31");
insert into tiposDatos (dateType) value("22-03-31");
insert into tiposDatos (dateType) value("71-03-31");
insert into tiposDatos (datetimeType) value("19-12-12 23:15:54");
insert into tiposDatos (datetimeType) value("19-12-12 23:15:54.5465"); -- micro segundos pero va redondear
select * from tiposDatos;

-- Usando la inicializacion y valor default para datetime y timestamp
drop table tiposDatos;
create table tiposDatos(
	dateType date,
    datetimeType datetime,
    ts timestamp default current_timestamp on update current_timestamp, -- va ser inicializado con la fecha actual pero cada que se actulice un registro se actualiza a la fecha actual
    dt datetime default current_timestamp on update current_timestamp
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

insert into tiposDatos (dateType) values ("2022/05/01"); -- agregamos un nueva fecha
update tiposDatos set dateType=("2022-07-01") 
where dateType= "2022-05-01"; -- aunque cambiemos manualmente una fecha indicada ts y dt se actualizarán 

select * from tiposDatos; 