-- Collations
-- A cada character set le corresponde una collation
-- Existen una variedad de collation para cada character set
-- conjunto de reglas para comparar caracteres y como serán ordenados
-- por ejemplo comparar la codificación de los characters

-- por ejemplo pueden ser (ci) case-insensitive: no le importan si son mayúsculas o minúsculas
-- 						  (cs) case_sensitive: importan si son mayúsculas o minúsculas
-- 						  (bin) ordenados de acuerdo a su código binario
-- 						  (ai) acent-insensitive (no distingue de characteres con acento)
-- 						  (as) acent-sensitive (distingue de characteres con acento)

-- mostrar las collations
show collation;

show collation
where charset like '%utf8%' ;

-- mostrar el collation default de un servidor
show variables like 'collation_server';

-- mostrar el collation asignado a cada tabla de una base de datos
select table_name, table_collation
from information_schema.tables
where table_schema='bdPendiente';