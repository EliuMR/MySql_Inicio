-- Revoke

-- muestra los permisops actuales de usuario2@localhost
show grants for usuario2@localhost;

-- revoca o elimina los permisos de usuario2
revoke all, grant option from usuario2@localhost;
show grants for usuario2@localhost;

-- seleccionamos usuario y host  de la tabla de la base de datos mysql
use mysql;
select user,host from user;

-- renombrar al usuario2 a usuario1
rename user usuario2@localhost to usuario1@localhost;

-- eliminar al usuario usuario2@localhost
drop user usuario1@localhost;