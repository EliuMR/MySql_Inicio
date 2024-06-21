-- Trigger
-- Un trigger en SQL es un objeto de base de datos que se ejecuta automáticamente cuando ocurre un evento 
-- específico en una tabla. Los eventos pueden ser operaciones INSERT, UPDATE o DELETE. 
-- Los triggers son útiles para implementar lógica de negocio y reglas de integridad referencial.


-- create trigger nombre_trigger
-- {before|after} {insert|update|delete} on nombre_tabla
-- for each row
-- sql block

-- crear un triger que cambie a minúsculas el correo a actualizar de la tala personas

drop trigger if exists personas_before_update;

delimiter //
create trigger personas_before_update
before update on personas -- tabla que se utilizará antes de ejecutar before
for each row
begin
	set new.correo=lower(new.correo); -- asignación al nuevo campo de correo a la función que tiene correo
    
end //
delimiter ;

-- probamos
select * from personas;

update personas
set correo = 'MICORREO@hotmail.com'
where id=1;

-- trigger que no permita insertar correo gmail
delimiter //
create trigger personas_before_update2
before update on personas -- tabla que se utilizará antes de ejecutar before
for each row
begin
	if new.correo like '%gmail%' then
		signal sqlstate 'HY000' -- forzamos un error
        set message_text=' No se acepta correos gmail';
    
    else -- continuas normal
		set new.correo=lower(new.correo); -- asignación al nuevo campo de correo a la función que tiene correo

    end if;
    
end //
delimiter ;

-- probamos
update personas
set correo = 'MICORREO@gmail.com'
where id=1;
select * from personas;


-- EJEMPLO
-- creamos una tabla
create table if not exists bdPendiente.log_eventos(
	nombreTabla varchar(25) not null,
    after_before varchar (45),
    valor_new varchar (45),
    valor_old varchar (45),
    estatus varchar (45),
    fecha_hora datetime
);
select * from log_eventos;
drop trigger if exists personas_before_update3;
-- trigger que no permita insertar correo gmail, pero que guarde los eventos de cambio
delimiter //
create trigger personas_before_update3
before update on personas -- tabla que se utilizará antes de ejecutar before
for each row
begin
	if new.correo like '%gmail%' then
		-- no se puede aquí guardar la información porque como forzamos un error no termina de ejecutarse
        -- y en mysql o sé realiza toda la instrucción o ninguna
		signal sqlstate 'HY000' -- forzamos un error
        set message_text=' No se acepta correos gmail';
    
    else -- continuas normal
		set new.correo=lower(new.correo); -- asignación al nuevo campo de correo a la función que tiene correo
		insert into log_eventos
        values('personas','before',new.correo, old.correo,'sí se pudo actualizar',now());
    end if;
    
end //
delimiter ;

-- probamos
update personas
set correo = 'MICORREO@gmail.com'
where id=1;
update personas
set correo = 'MICORREO@hotyou.com'
where id=2;
update personas
set correo = 'MICORREO@outlook.com'
where id=3;
select * from personas;
select * from log_eventos;
