-- Columnas calculadas o generadas(se usan expreciones a partir de otras columnas)
-- col_name data_type[Generated always] as (expr)
-- 		[virtual | stored] [Not null |	null] Permite guardar o no en la base de datros como un dato más calculado
-- 		[unique[key]][[primary] key]
--      [comment 'string']

use bdTemporal;
rename table clientes to cliente;

create table ejemploCampoCalculado(
	id int(11) not null		auto_increment,
    cantidad double not null,
    precio double not null,
    -- dos campos calculados
    totalSinDescueto double as (cantidad*precio) not null,
    diezPorCientoDescuento double generated always as (cantidad*precio/10) virtual not null,
    primary key (id)
)engine = InnoDB;

insert into ejemploCampoCalculado (id,cantidad,precio) values (0,10,100);
insert into ejemploCampoCalculado (id,cantidad,precio) values (0,1,10);

select * from ejemplocampocalculado;

-- actalización registro, los campos calculados permite volver a calcular con datos actulizados
update ejemploCampoCalculado
set precio = 2200
where id =1;