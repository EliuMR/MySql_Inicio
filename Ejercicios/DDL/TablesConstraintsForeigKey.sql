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
	id				int 		primary key		not null	unique		auto_increment,
    nombreProducto	varchar(10)	unique,
    costo 			decimal(8,2)not null		default 0,
    precioVenta 	decimal(8,2)not null		default 0,
    existencia		decimal(8,2)not null 		default 0
);


create table if not exists detalleVenta(
	id				int 		primary key		not null	unique		auto_increment,
    fechaVenta		date		not null,
    idClientes		int			not null, -- llave foreana
    idProductos		int 		not null, -- llave foranea
    cantidadVendida	decimal(10,2) not null,
    costo 			decimal(8,2)not null		default 0,
    precioVenta		decimal(8,2) not null,
    
    -- Llaves foraneas (Integridad referencial)
    -- [] - significa opcional
    -- [constraint [nombreConstraint]]
	-- 	foreign key [index_name](col_name,...)
    --  references tbl_name (col_name,...)
    --  [on dealeate reference_option{cascade | set null | no action | set defauilt}] 
    constraint fkDetalleVentaProductos 
    foreign key (idProductos)
    references productos (id)
    on delete no action,
    
    constraint fkDetalleVentaClientes
    foreign key (idClientes)
    references Clientes (id)
    on delete no action -- no permite borrar elementos elementos que estes  siendo usados en otroas tablas (Integridad referencial)
			-- cascade -   permite eliminar todos los elementos que tengan referencia 
);


-- Llenamos tablas
insert into clientes(id,nombreCliente,ciudad,telefono) values (1,"José","CDMX","0125165465");
insert into clientes(id,nombreCliente,ciudad,telefono) values (2,"Karla","Puebla","12315466");
insert into clientes(id,nombreCliente,ciudad,telefono) values (3,"Julio","Tehuacan","4565464565");
insert into clientes(id,nombreCliente,ciudad,telefono) values (4,"Karol","Monterrey","5646546465");

insert into productos (id, nombreProducto, costo, precioVenta, existencia) value (1,"Piano",100,110,5);
insert into productos (id, nombreProducto, costo, precioVenta, existencia) value (2,"Teclado",10,20,6);
insert into productos (id, nombreProducto, costo, precioVenta, existencia) value (3,"Violín",20,25,7);

insert into detalleVenta (id,fechaVenta,idClientes,idProductos,cantidadVendida,costo,precioVenta) value (1,"2019-12-21",1,1,2,100,120);
insert into detalleVenta (id,fechaVenta,idClientes,idProductos,cantidadVendida,costo,precioVenta) value (2,"2019-12-20",1,2,1,10,25);
insert into detalleVenta (id,fechaVenta,idClientes,idProductos,cantidadVendida,costo,precioVenta) value (3,"2019-12-19",2,3,2,20,30);

select * from detalleVenta;
select * from productos;
select * from clientes;

-- delete from clientes where id=1; -- borra el cleinte id 1
