-- Crear base datos 
create database if not exists bdTemporal;

use bdTemporal;

-- Crear tabla, si no existe, bfNombre. (opcional)
-- Atributos:
	-- not null- no acepta nulos
    -- unique -cada valor en la columna es único
    -- default -valor por default para cada columna
    -- auto_increment valor incrementado automáticamente
	-- primary_key
    
-- tabla que no tenga ningún atributo
create table if not exists bdTemporal.clientes (
	id 				int,
    nombreCliente 	varchar(30),
    ciudad 			varchar(30),
    telefono 		varchar(30)
);

-- tabla que tenga atributos
create table if not exists bdTemporal.productos (
	id 				int 			not null		unique		auto_increment,
    nombreProducto 	varchar(30) 	unique,
    costo 			decimal(8,2) 	not null 		default 0,
    precioVenta 	decimal (8,2) 	not null		default 0,
    existencia 		decimal(8,2) 	not null		default 0
);

-- agregando 
-- no importa si ponemos 0 en id, se irá autoincrementado automáticamente
insert into productos 				values(0,"Refresco",10.50,11.5,5);
-- insert into productos 				values(0,"Refresco",10.50,11.5,5); -- generaría un error porque el nombre del producto debe se único;
insert into productos (id,nombreProducto) values(0,"Agua");

select * from productos;

-- Tabla temporal: sólo dura mientras la sesión esté encendida, no son mostradas por lo esquemas
create temporary table tmpProductos select * from productos;
select * from tmpProductos;

-- Tabla copia:
create table copiaProductos select * from productos;
select * from copiaProductos;

-- Tabla copia pero sólo la estructura, no pasa los datos
create table copiaProductos1 like productos;
select * from copiaProductos1;

-- Borrar Tablas
DROP TABLE IF EXISTS  copiaProductos1;