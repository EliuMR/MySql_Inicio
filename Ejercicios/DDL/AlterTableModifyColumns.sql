-- Alter Table (Editar tablas)
-- alter table [dbNombre.]nombreTabla(
--   add nombreColumna tipoDeDato [atributosColumna][First|After existing_column]);
--   drop column nombreColumna |
-- 	 modify nombreColumna tipoDato [atributosColumna] |
--   change column anteriorNombreColumna nuevoNombreColumna

-- Usamos la base de datos del archivo TablesConstrinsForeignKey
use bdTemporal;

-- Mostrar estructura de la tabla productos
desc productos;

-- Agregar una columna a la tabla de productos llamada color
alter table productos 
add color varchar(10);

-- Borradno columna, no se puede borrar una columna que viole la integridad, por ejemplo llaves foraneas
alter table productos 
drop color ;

-- Agregar una columna color depués de la columna llamada costo
alter table productos 
add color varchar(10) after costo;

-- modificar el tamaño de una columna, si ya hay datos si coloco un tamaño menor saldrá un errror
-- Si hay valores escritos no puedo cambiar el tipo de dato por ejemplo de varchar a intehger
alter table productos 
modify color varchar(15) null;

-- cambiar un valor default, se cambiará en los nuevos registros
alter table productos 
modify color varchar(15) default "blanco";

-- cambiar nombre
alter table productos 
change column color Coulor varchar(15);

select * from productos;