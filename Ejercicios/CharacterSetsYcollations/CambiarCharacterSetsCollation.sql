-- mostrar el character set default y collation para una base de datos

show variables like 'collation_database';
show variables like 'character_set_database';

-- creamos una base de datos temporal para ver qué characterset y collation le asigna default
create database if not exists bdPendienteTemporal;
drop database if exists bdPendienteTemporal;

-- creamos otra base de datos temporal para que ahora le especifiquemos un character set diferente
-- al default lo mismo hacemos con el collation
create database if not exists bdPendienteTemporal1 charset 'utf8mb3' collate 'utf8_general_ci';
drop database if exists bdPendienteTemporal1;

-- le cambiamos el charset a una base de datos existente,- automáticamente cambiará el collate al default
alter database bdPendienteTemporal1 charset 'utf8mb4';

-- le cambiamos el collation por otro, automaticamente cambiará el charset también
alter database bdPendienteTemporal1 collate 'utf8mb4_0900_ai_ci';
