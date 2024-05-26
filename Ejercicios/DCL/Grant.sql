-- La seguridad en las bases de datos es mediante instrucciones SQL ya sea para crear usuariops
-- o mediante configuraciones en workbench para dar seguridad a ciertas tareas

-- column_priv		privilegio de columnas
-- db				privilegio de bases de datos
-- func				funciones definidas por los usuarios
-- host 			privilegios host y databases
-- tables_priv		privilegio de tablas
-- user				usuarios y privilegios globales

-- DDL 				lenguaje de definición de datos
-- DML				lenguaje de manipulación de datos
-- DCL				lenguaje de control de datos
					-- Grant: Asigna permisos a los usuarios
					-- Revoke: Elimina permisos sobre un objeto
-- TCL				lenguaje de control de transacciones

-- Dos tipos de privilegios
		-- privilegios al trabajar con datos: select, insert, update, delete, execute
        -- privilegios para modificar la estructura de la base de datos: create, alter, drop, index, create, trigger, event
        
-- muestra privilegios
show privileges;

-- crear un usuario llamado usuario con password 12345 en localhost
create user usuario@localhost identified by '12345';

-- seleccionamos usuario y host  de la tabla de la base de datos mysql
use mysql;
select user,host from user;

-- asignamos todos los permisos al usuario al database bdPendiente
grant all 
on bdPendiente.* -- asignamos todos los permisos sobre dicho database
to usuario@localhost;

-- muestra privilegios sobre usuario@localhost
show grants for usuario@localhost;

-- crear un usuario llamado usuario2 con password 321 en localhoat que solo tenga
-- permisos para seleccionar e insertar datos

create user usuario2@localhost identified by '321';
grant select, insert
on bdPendeinte.*
to usuario2@localhost;
-- este usuario no podría delete por ejemplos
-- muestra privilegios sobre usuario@localhost
show grants for usuario2@localhost;








