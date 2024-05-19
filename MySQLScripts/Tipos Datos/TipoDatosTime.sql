drop table tiposDatos;
create table tiposDatos(
	timeType time,
    timeType1 time(3), -- 3 decimales a los segundos
    timeType2 time(6)  -- 6 decimales a los segundos, son la máxima cantidad
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

delete from tiposDatos;
insert into tiposdatos (timeType,timeType1,timeType2) values ("12:45:15","12:45:15.41","12:45:15.5444");
insert into tiposdatos (timeType,timeType1,timeType2) values ("800:45:15","-15:45:15.41","12:45:15.5444"); -- podemos agrefar mas de 12 horas o negativas ya que se leen como diferencias de horas no como la hora actual
insert into tiposdatos (timeType,timeType1,timeType2) values ("114515","12:45:15.41","12:45:15.5444");
insert into tiposdatos (timeType,timeType1,timeType2) values ("1","11:12","1215.5444");
select * from tiposdatos;