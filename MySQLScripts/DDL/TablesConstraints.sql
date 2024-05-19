-- Crear base datos 
create database if not exists bdTemporal;

use bdTemporal;

-- Crear table con constrain a nivel columna (primary key) o unique
create table if not exists bdTemporal.clientes (
	id 				int			primary key 	auto_increment,
    nombreCliente 	varchar(30)	not null		unique,
    ciudad 			varchar(30),
    telefono 		varchar(30)
);


-- Crear table con constrain a nivel tabla
create table if not exists bdTemporal.clientes (
	id 				int		 	auto_increment,
    nombreCliente 	varchar(30)	not null,
    ciudad 			varchar(30),
    telefono 		varchar(30),
    constraint clientes_pk primary key (id), -- ó primary key (id)
    constraint nombreCliente_uq unique (nombreCliente) -- ó unique (nombreCliente)
);
select * from clientes;