-- Importando datos a las tablas
-- Para cargar los archivos debe realizarse con la que no tenga keys foraneas hasta las que tenga mas detalle
load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\1.-TablaEstatusPendiente.csv'
into table estatusPendiente
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;

select * from estatusPendiente;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\2.- personas.csv'
into table personas
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from personas;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\A.- tabla TipoIngEg.csv'
into table tipoIngresoEgreso
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from tipoIngresoEgreso;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\B.- tabla grupoIngEg.csv'
into table grupoIngresoEgreso
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from grupoIngresoEgreso;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\4.- tabla pendientes.csv'
into table pendientes
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from pendientes;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\3.- tabla usuarios.csv'
into table usuarios
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from usuarios;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\C.- tabla IngresosEgresos.csv'
into table ingresosEgresos
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from ingresosEgresos;

load data infile 'C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\D.- tabla EntradaSalidaDinero.csv'
into table entradaSalidaDinero
fields terminated by ','
enclosed by '"'
lines terminated by '\r\n'
ignore 1 rows;
select * from entradaSalidaDinero;

-- sirve para checar si un archivo se encuentra en tal dirección
SELECT LOAD_FILE('C:\\Users\\elium\\Documents\\SQL\\BaseDatosPendientes\\archivos\\1.-TablaEstatusPendiente.csv');
