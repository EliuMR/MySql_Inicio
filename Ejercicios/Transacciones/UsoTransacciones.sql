-- TRANSACCIONES
-- cuando se ejecutan intrucciones en la base de dato, se realizan de manera inmediata,
-- mediante el uso de transacciones decidimos si se ejecutan el resto de instrucciones auqnue haya erores

-- para trabajar con transacciones es necesario que la base de datos tenga Engine= InnoDB
drop procedure if exists transacciones;
delimiter //
create procedure transacciones()
begin 
	declare sql_error tinyint default false; -- error por defecto en falso, i.e, no ha ocurrido error
	declare continue handler for sqlexception -- manejador para error en caso de exepción
		set sql_error = true;				-- cambiamos la bandera
        
    start transaction;
    -- un insert (que si se ejecuta)
    -- un deleate (si se ejecuta)
    -- un update (no se puede viola integridad referencial)
    
    if sql_error = false then 
		commit;
        select 'La transacción fue ejecutada';
	else 
		rollback; -- si viola la integridad referencial por ejemplo, regresa todos los valores a como estaban antes
        select 'La transacción no fue ejecutada';
	end if;
end // 
delimiter ;

 -- instruccion válida
 delete from tmppersonas;
 
 -- instrucción válida
 insert into tmppersonas
 select * from personas;
 
 -- instrucción válida
 update tmppersonas set telefono='450';
 
 -- instrucción no válida porque lleva nulo en el campo del nombre y no es permitido
 insert into tmppersonas
 values(0,null,'venta@gmail.com','12121212');
 
 -- hicieron valida las tres primeras instrucciones
 
 -- vamos a ver con el uso de transacciones
 
 drop procedure if exists transacciones;
delimiter //
create procedure transacciones()
begin 
	declare sql_error tinyint default false; -- error por defecto en falso, i.e, no ha ocurrido error
	declare continue handler for sqlexception -- manejador para error en caso de exepción
		set sql_error = true;				-- cambiamos la bandera
        
    start transaction;
     -- instruccion válida
	 delete from tmppersonas;
	 
	 -- instrucción válida
	 insert into tmppersonas
	 select * from personas;
	 
	 -- instrucción válida
	 update tmppersonas set telefono='450';
	 
	 -- instrucción no válida porque lleva nulo en el campo del nombre y no es permitido
	 insert into tmppersonas
	 values(0,null,'venta@gmail.com','12121212');
    
    if sql_error = false then 
		commit;
        select 'La transacción fue ejecutada';
	else 
		rollback; -- si viola la integridad referencial por ejemplo, regresa todos los valores a como estaban antes
        select 'La transacción no fue ejecutada';
	end if;
end // 
delimiter ;

select * from tmppersonas;

call transacciones;