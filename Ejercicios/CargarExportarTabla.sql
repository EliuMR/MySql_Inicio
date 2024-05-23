select * from pendientes
INTO OUTFILE
	'c:\\archivos\\tablaspendientes.csv'
    FIELDS TERMINATED BY ','
    ENCLOSED BY '"'
    LINES TERMINATED BY '\r\n';
-- borrando datos de la tabla
SET SQL_SAFE_UPDATES = 0; -- Para error de  safe-updates option set.
delete from pendientes;

select * from pendientes;

load data infile 'c:\\archivos\\tablaspendientes.csv'
into table pendientes -- en que tabla 
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'