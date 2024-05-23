-- Rango entre 1901 a 2155 y 0000
-- tipo de dato year ocupa 1 byte
drop table tiposDatos;
create table tiposDatos(
	yearType year
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

delete from tiposDatos;
insert into tiposdatos (yearType) values ("0000");
insert into tiposdatos (yearType) values ("1"); -- podemos agrefar mas de 12 horas o negativas ya que se leen como diferencias de horas no como la hora actual
insert into tiposdatos (yearType) values ("03"); -- guardaria 2003
insert into tiposdatos (yearType) values ("70"); -- guardaria 1970
insert into tiposdatos (yearType) values (1970); -- puede ser sin comillas
insert into tiposdatos (yearType) values (now());
select * from tiposdatos;