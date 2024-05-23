-- rename table nombreAntiguio to NombreNuevo

-- renombrar la tabla clientes a cliente
-- Usamos la base de datos del archivo TablesConstrinsForeignKey
-- No afecta la integridad referencial al renombrar
use bdTemporal;
rename table clientes to cliente;

select * from detalleVenta;
-- borrar todos lo datos de la tabla detalleventa
truncate table detalleVenta; -- la tabla guarda su estructura, no puede borrar si tienen llaves foráneas, tiene integridad referenciasñ
-- similar a delete from detallaVenta; -- borra la información, pero por ejemplo permite seguir con los indices, truinquete la destruye
 
 drop table detalleventa; -- elimina tabla, pero no si tiene integridad referencial
