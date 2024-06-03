-- Character sets y collations

-- Tres character sets usados conmúmente
-- latin1: Un byte por caracter mayoría de los caracteres en los idiomas Europa Occidenta{
-- utf8mb3: Tres bytes, proporciona la mayoría de los idiomas del mundo
-- utf8mb4: Cuatro bytes, igual al anterior más emogis

-- mostrar todos los character set en un servidor de bases de datos
show char set
like '%tf8mb%' ;

-- mostrar el character set default para un servidor
show variables like 'character_set_server';

-- mostrar el character set default para un dataset
show variables like 'character_set_database';

-- versión de mysql 8 o mayores utiliza por defecto character_set utf8mb4 pero por ejemplo
-- utilizando varchr(X) pues seguimos almacenando dicha cantidad de información 