drop table tiposDatos; -- Elimina tablas

-- Creamos tablas pero esto no se guarda por el momento en niungun esquema
CREATE table tiposDatos(
	decimal165_2 decimal(65,2),
    decimalType decimal (5,3),
    floatType float,
    doubleType double
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

SET SQL_SAFE_UPDATES = 0;
delete from tiposDatos; -- Borramos contenido tabla
-- Insertamos un dato en decimal165_2 a la tabla
insert into tiposDatos (decimal165_2) values (12312131263121321321321321321312231231);
select * from tiposDatos;

SET SQL_SAFE_UPDATES = 0;
delete from tiposDatos;
-- Insertamos un dato en decimalType a la tabla
insert into tiposDatos (decimalType) values (12.13);
insert into tiposDatos (decimal165_2) values (12312131263121321321321321321312231231);
select * from tiposDatos;

SET SQL_SAFE_UPDATES = 0;
delete from tiposDatos;
insert into tiposDatos (floatType,doubleType) values (12.1165663,12.23165); -- Va redondear el float
select * from tiposDatos;