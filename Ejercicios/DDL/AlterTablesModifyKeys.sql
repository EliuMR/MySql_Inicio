-- Agregrar o borrar llaves foráneas o primarias
-- Alter Table (Editar tablas)
-- alter table [dbNombre.]nombreTabla(
--   add 		primary key definicionDeConstraint |
--   add		[contraint nombreConstraint] foreign key definicionDeConstraint |
-- 	 drop		primary key |
--   drop		foreign key nombreConstraint

-- Borrando base de datos
drop database if exists bdTemporal;

-- Creando una base de datos llamada bdTemporal  si no existe 
create database if not exists bdTemporal;

use bdTemporal;

create table if not exists bdTemporal.clientes (
	id 				int			primary key 	auto_increment,
    nombreCliente 	varchar(30)	not null		unique,
    ciudad 			varchar(30),
    telefono 		varchar(30)
);

create table if not exists productos(
	id				int 		not null	unique		auto_increment,
    nombreProducto	varchar(10)	unique,
    costo 			decimal(8,2)not null		default 0,
    precioVenta 	decimal(8,2)not null		default 0,
    existencia		decimal(8,2)not null 		default 0
);


create table if not exists detalleVenta(
	id				int 		not null	unique		auto_increment,
    fechaVenta		date		not null,
    idClientes		int			not null, -- llave foreana
    idProductos		int 		not null, -- llave foranea
    cantidadVendida	decimal(10,2) not null,
    costo 			decimal(8,2)not null		default 0,
    precioVenta		decimal(8,2) not null
);



-- Agregar la llave primaria en la tabla detalleVenta, siendo la llave primaria el campo ID
alter table bdTemporal.detalleVenta
add primary key(id);

alter table bdTemporal.productos
add primary key(id);

-- Mostrar estructura de la tabla productos
desc productos;

-- Agregar llave foranea
alter table bdTemporal.detalleVenta
add 
	constraint fkDetalleVentaProductos
	foreign key(idProductos)
    references productos(id)
    on delete no action;
    
-- Agregar llave foranea
alter table bdTemporal.detalleVenta
add 
	constraint fkDetalleVentaClientes
	foreign key(idClientes)
    references Clientes(id)
    on delete no action;
    
desc productos;


-- borrar la llave primaria
alter table productos
drop primary key;

-- borrar la llave foraneas
alter table detalleVenta
drop foreign key fkDetalleVentaProductos;